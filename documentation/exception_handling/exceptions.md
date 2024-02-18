# External Failure

**response.status**

# Infra Failure

**HttpFailure < response.status**
**LocalStorageFailure < code**

# Data Failure

**MapperFailure < code**

# Domain Failure

**DomainFailure < HttpFailure**
**DomainFailure < LocalStorageFailure**
**DomainFailure < MapperFailure**

# UI Failure

**I18n < DomainFailure**
