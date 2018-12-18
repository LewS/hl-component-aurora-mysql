CfhighlanderTemplate do
  Name 'aurora-mysq'
  Description "Highlander Aurora MySQL component #{component_version}"
  ComponentVersion component_version
  DependsOn 'vpc'

  Parameters do
    ComponentParam 'EnvironmentName', 'dev', isGlobal: true
    ComponentParam 'EnvironmentType', 'development', isGlobal: true, allowedValues: ['development', 'production']
    ComponentParam 'StackOctet', isGlobal: true
    ComponentParam 'WriterInstanceType'
    ComponentParam 'ReaderInstanceType'
    ComponentParam 'DnsDomain'
    ComponentParam 'SnapshotID'
    ComponentParam 'EnableReader', 'false'
    ComponentParam 'VPCId', type: 'AWS::EC2::VPC::Id'
    maximum_availability_zones.times do |az|
      ComponentParam "SubnetPersistence#{az}"
    end
  end
end
