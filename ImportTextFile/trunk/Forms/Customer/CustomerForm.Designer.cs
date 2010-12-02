namespace ImportTextFile.Forms.Customer
{
    partial class CustomerForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.filePath_label = new System.Windows.Forms.Label();
            this.filePath_textBox = new System.Windows.Forms.TextBox();
            this.start_button = new System.Windows.Forms.Button();
            this.filePath_openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.import_progressBar = new System.Windows.Forms.ProgressBar();
            this.browse_button = new System.Windows.Forms.Button();
            this.SuspendLayout();
            //
            // filePath_label
            //
            this.filePath_label.AutoSize = true;
            this.filePath_label.Location = new System.Drawing.Point(13, 13);
            this.filePath_label.Name = "filePath_label";
            this.filePath_label.Size = new System.Drawing.Size(51, 13);
            this.filePath_label.TabIndex = 0;
            this.filePath_label.Text = "File Path:";
            //
            // filePath_textBox
            //
            this.filePath_textBox.Location = new System.Drawing.Point(70, 12);
            this.filePath_textBox.Name = "filePath_textBox";
            this.filePath_textBox.Size = new System.Drawing.Size(244, 20);
            this.filePath_textBox.TabIndex = 1;
            //
            // start_button
            //
            this.start_button.Enabled = false;
            this.start_button.Location = new System.Drawing.Point(158, 38);
            this.start_button.Name = "start_button";
            this.start_button.Size = new System.Drawing.Size(91, 23);
            this.start_button.TabIndex = 2;
            this.start_button.Text = "Start Import";
            this.start_button.UseVisualStyleBackColor = true;
            this.start_button.Click += new System.EventHandler(this.start_button_Click);
            //
            // import_progressBar
            //
            this.import_progressBar.Location = new System.Drawing.Point(12, 67);
            this.import_progressBar.Name = "import_progressBar";
            this.import_progressBar.Size = new System.Drawing.Size(383, 23);
            this.import_progressBar.TabIndex = 3;
            //
            // browse_button
            //
            this.browse_button.Location = new System.Drawing.Point(320, 8);
            this.browse_button.Name = "browse_button";
            this.browse_button.Size = new System.Drawing.Size(75, 23);
            this.browse_button.TabIndex = 4;
            this.browse_button.Text = "Browse";
            this.browse_button.UseVisualStyleBackColor = true;
            this.browse_button.Click += new System.EventHandler(this.Browse_button_Click);
            //
            // CustomerForm
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(407, 98);
            this.Controls.Add(this.browse_button);
            this.Controls.Add(this.import_progressBar);
            this.Controls.Add(this.start_button);
            this.Controls.Add(this.filePath_textBox);
            this.Controls.Add(this.filePath_label);
            this.Name = "CustomerForm";
            this.Text = "Customer";
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion Windows Form Designer generated code

        private System.Windows.Forms.Label filePath_label;
        private System.Windows.Forms.TextBox filePath_textBox;
        private System.Windows.Forms.Button start_button;
        private System.Windows.Forms.OpenFileDialog filePath_openFileDialog;
        private System.Windows.Forms.ProgressBar import_progressBar;
        private System.Windows.Forms.Button browse_button;
    }
}