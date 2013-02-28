using System;
using System.Collections.Generic;
using System.Web;
using System.Workflow.Runtime;
using System.Workflow.Runtime.Hosting;

namespace SME.UserSystem.Core.Workflow
{
    public sealed class WorkflowManager
    {
        public static void ExecuteWorkflow(Type workflowType, Dictionary<string, object> properties)
        {
            WorkflowRuntime workflowRuntime;

            workflowRuntime = Init();

            ManualWorkflowSchedulerService manualScheduler = workflowRuntime.GetService<ManualWorkflowSchedulerService>();
            WorkflowInstance instance = workflowRuntime.CreateWorkflow(workflowType, properties);
            instance.Start();

            EventHandler<WorkflowCompletedEventArgs> wfCompletedHandler = null;
            wfCompletedHandler = ((object sender, WorkflowCompletedEventArgs e) =>
            {
                if (e.WorkflowInstance.InstanceId == instance.InstanceId)
                {
                    workflowRuntime.WorkflowCompleted -= wfCompletedHandler;
                    Dictionary<string, object>.Enumerator enumerator = e.OutputParameters.GetEnumerator();
                    while (enumerator.MoveNext())
                    {
                        KeyValuePair<string, object> pair = enumerator.Current;
                        if (properties.ContainsKey(pair.Key))
                        {
                            properties[pair.Key] = pair.Value;
                        }
                    }
                }
            });

            EventHandler<WorkflowTerminatedEventArgs> wfTerminated = null;
            wfTerminated = ((object sender, WorkflowTerminatedEventArgs e) =>
            {
                if (e.WorkflowInstance.InstanceId == instance.InstanceId)
                {
                    workflowRuntime.WorkflowTerminated -= wfTerminated;

                    if (null != e.Exception)
                        throw new Exception(e.Exception.Message);
                }
            });

            workflowRuntime.WorkflowCompleted += wfCompletedHandler;
            workflowRuntime.WorkflowTerminated += wfTerminated;
            manualScheduler.RunWorkflow(instance.InstanceId);
        }

        public static WorkflowRuntime Init()
        {
            WorkflowRuntime workflowRuntime;

            // Running in local mode, create an return new runtime
            if (HttpContext.Current == null)
                workflowRuntime = new WorkflowRuntime();
            else
            {
                // running in web mode, runtime is initialized only once per application
                if (HttpContext.Current.Application["WorkflowRuntime"] == null)
                    workflowRuntime = new WorkflowRuntime();
                else
                    return HttpContext.Current.Application["WorkflowRuntime"] as WorkflowRuntime;
            }

            ManualWorkflowSchedulerService manualService = new ManualWorkflowSchedulerService();
            workflowRuntime.AddService(manualService);
            workflowRuntime.StartRuntime();
            // on web mode, store the runtime in application context so that
            // it is initialized only once. On dekstop mode, ignore
            if (null != HttpContext.Current)
                HttpContext.Current.Application["WorkflowRuntime"] = workflowRuntime;

            return workflowRuntime;
        }

        public static void Terminate()
        {
            if (HttpContext.Current == null) return;

            WorkflowRuntime workflowRuntime = HttpContext.Current.Application["WorkflowRuntime"] as System.Workflow.Runtime.WorkflowRuntime;
            workflowRuntime.StopRuntime();
            workflowRuntime.Dispose();

            HttpContext.Current.Application.Remove("WorkflowRuntime");
        }
    }
}