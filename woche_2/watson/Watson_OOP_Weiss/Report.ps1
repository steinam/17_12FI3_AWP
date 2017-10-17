class Report{

    [string]$ReportID
    [int]$ReportType
    [string]$EventTime
    [string]$BucketID
    [string]$Appname

    Report($repid, $repType, $evTime, $buckId, $appnam)
    {
        $this.ReportID = $repid
        $this.ReportType = $repType
        $this.EventTime = $evTime
        $this.BucketID = $buckId
        $this.Appname = $appnam
    }

}