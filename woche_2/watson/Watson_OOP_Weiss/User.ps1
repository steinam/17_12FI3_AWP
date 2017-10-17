class User{

    [string]$Name

    #Konstruktormehode, die beim Erzeugen von User aufgerufen wird
    User([string]$uname)
    {
        $this.Name = $uname
    }
}