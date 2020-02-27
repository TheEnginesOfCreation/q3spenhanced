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