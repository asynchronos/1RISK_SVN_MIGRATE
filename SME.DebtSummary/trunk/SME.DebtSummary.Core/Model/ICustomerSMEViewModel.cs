using System;

namespace SME.DebtSummary.Core.Model
{
    public interface ICustomerSMEViewModel
    {
        Int32 CIF { get; set; }

        Int32? GROUP_ID { get; set; }

        String CM_CODE { get; set; }

        String OLD_CM_CODE { get; set; }

        Int16? BRANCH_ID { get; set; }

        String JUDGEMENT_ID { get; set; }

        String BUSI_RISK1_ID { get; set; }

        String BUSI_RISK2_ID { get; set; }

        String BUSI_RISK3_ID { get; set; }

        Decimal? BUSINESS_DESTINATION_ID { get; set; }

        Decimal? EXPORT_WEIGHT { get; set; }

        Decimal? LOCAL_WEIGHT { get; set; }

        Int32? STATUS_ID { get; set; }

        Int32? SIZE_ID { get; set; }

        DateTime? UPDATE_DATE { get; set; }

        String UPDATE_BY { get; set; }

        Int32? RATING_TYPE_KEY { get; set; }

        Int32? RATING_KEY { get; set; }

        DateTime? RATING_UPDATE_DATE { get; set; }

        String EXTERNAL_SOURCE_MEMO { get; set; }

        DateTime? NEXT_REVIEW_DATE { get; set; }
    }
}