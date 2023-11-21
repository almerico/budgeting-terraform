variable "region" {
  type    = string
  default = "eu-west-1"
}
variable "account_name" {
  description = "Specifies the name of the AWS account"
  type        = string
  default     = "Structura"
}

variable "account_budget_limit" {
  description = "Set the budget limit for the AWS account."
  type        = string
  default     = "500"
}

variable "budget_limit_unit" {
  description = "The unit of measurement used for the budget forecast, actual spend, or budget threshold."
  type        = string
  default     = "USD"
}

variable "budget_time_unit" {
  description = "The length of time until a budget resets the actual and forecasted spend. Valid values: `MONTHLY`, `QUARTERLY`, `ANNUALLY`."
  type        = string
  default     = "MONTHLY"
}

variable "services" {
  description = "Define the list of services and their limit of budget."
  type = map(object({
    budget_limit = string
  }))
  default = {
    S3 = {
      budget_limit = 25
    },
    ECR = {
      budget_limit = 15
    },
    ECS = {
      budget_limit = 1
    }
    DynamoDB = {
      budget_limit = 100
    }
    SQS = {
      budget_limit = 1
    }
    SES = {
      budget_limit = 50
    }
    SNS = {
      budget_limit = 50
    }
    Lambda = {
      budget_limit = 100
    }
    Cognito = {
      budget_limit = 50
    }
    Kubernetes = {
      budget_limit = 1
    }
    Gateway = {
      budget_limit = 100
    }
    CloudWatch = {
      budget_limit = 100
    }
    VPC = {
      budget_limit = 10
    }
    EC2 = {
      budget_limit = 10
    }
    CloudFront = {
      budget_limit = 10
    }
  }
}

variable "notifications" {
  description = "Can be used multiple times to configure budget notification thresholds."
  type = map(object({
    comparison_operator = string
    threshold           = number
    threshold_type      = string
    notification_type   = string
  }))

  default = {
    warning = {
      comparison_operator = "GREATER_THAN"
      threshold           = 100
      threshold_type      = "PERCENTAGE"
      notification_type   = "ACTUAL"
    },
    critical = {
      comparison_operator = "GREATER_THAN"
      threshold           = 110
      threshold_type      = "PERCENTAGE"
      notification_type   = "ACTUAL"
    }
  }
}
variable "tags" {
  type        = map(string)
  default     = { "CreatedBy" = "Terraform" }
  description = "Additional tags."
}
