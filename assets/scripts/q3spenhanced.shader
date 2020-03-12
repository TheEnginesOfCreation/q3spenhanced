menu/art/tdm
{
	surfaceparm nomarks
	cull none

	{
		map menu/art/tdm.tga
		rgbGen identity
	}
	{
		map menu/art/sepiaflagmap.tga
		tcGen environment
		tcmod scale .9 .3
		tcmod scroll .01 .07
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
	{
		map menu/art/tdm.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map textures/sfx/shadow.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

menu/art/ctf
{
	surfaceparm nomarks
	cull none

	{
		map menu/art/ctf.tga
		rgbGen identity
	}
	{
		map menu/art/sepiaflagmap.tga
		tcGen environment
		tcmod scale .9 .3
		tcmod scroll .01 .07
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
	{
		map menu/art/ctf.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map textures/sfx/shadow.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

menu/art/1v1
{
     cull disable
     surfaceparm alphashadow
     surfaceparm trans	
     surfaceparm nomarks
     //tessSize 64
     //deformVertexes wave 30 sin 0 3 0 .2
     //deformVertexes wave 100 sin 0 3 0 .7
     
	{
		map menu/art/1v1.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

menu/art/blueteam
{
	surfaceparm nomarks
	cull none

	{
		map textures/ctf/ctf_blueflag.tga
		rgbGen identity
	}
	{
		map textures/effects/redflagmap.tga
		tcGen environment
		tcmod scale .9 .3
		tcmod scroll .01 .07
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
	{
		map textures/ctf/ctf_blueflag.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map textures/sfx/shadow.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

menu/art/redteam
{
	surfaceparm nomarks
	cull none

	{
		map textures/ctf/ctf_redflag.tga
		rgbGen identity
	}
	{
		map textures/effects/blueflagmap.tga
		tcGen environment
		tcmod scale .9 .3
		tcmod scroll .01 .07
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
	{
		map textures/ctf/ctf_redflag.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map textures/sfx/shadow.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

menu/art/blueflag
{
	surfaceparm nomarks
	cull none

	{
		map textures/ctf/ctf_blueflag.tga
		rgbGen identity
	}
	{
		map textures/effects/redflagmap.tga
		tcGen environment
		tcmod scale 9 3
		tcmod scroll .1 .7
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
	{
		map textures/ctf/ctf_blueflag.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map textures/sfx/shadow.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


menu/art/redflag
{
	surfaceparm nomarks
	cull none

	{
		map textures/ctf/ctf_redflag.tga
		rgbGen identity
	}
	{
		map textures/effects/blueflagmap.tga
		tcGen environment
		tcmod scale 9 3
		tcmod scroll .1 .7
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
	{
		map textures/ctf/ctf_redflag.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map textures/sfx/shadow.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}