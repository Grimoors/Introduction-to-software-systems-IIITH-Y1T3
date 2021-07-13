#extended arguments


d = {'apple':18, 'orange': 69, 'bananana':5, 'Glourious Holey Dayta':1}


#print(1,2, d,' This is Poemtry ')


def hypervolume(*dimentions):
    a = 1
    print (dimentions)
    for v in dimentions:
        a*=v
    print(a)

hypervolume(2,3,4,5,6)


def tag ( name , ** kwargs ):
    print ( name )
    print ( kwargs )
    print ( type ( kwargs ))

tag ( 'img' , src="iiit.png" , alt="knowledge" , border=1 )

