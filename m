Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DC2F88DA
	for <lists+nouveau@lfdr.de>; Fri, 15 Jan 2021 23:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192A96E4D0;
	Fri, 15 Jan 2021 22:51:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEA46E418;
 Fri, 15 Jan 2021 14:13:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EBAC758073A;
 Fri, 15 Jan 2021 09:13:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 15 Jan 2021 09:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=tj2SxXoSa96FfDtLrh9IpSrjSWA
 c9uYGz+Dn9iyVoAo=; b=B7b719RQYKeJsatdvoMfftPaZ7yza1XeB2tdCt+EfXJ
 lyEobF8ynRrdN7pxtUoPCNN3dfilyUknC7aTjyaF4oJihyfecKY12lq6IgiU5Cz1
 Vra/Uwe7W13TjbG6KqN24oHHPrC1/88iYYfOg2wCPjrXLB0GDaNS3PDyATP1pXej
 5HHLRWc0r29gZRdE1uLJv6pc5aMOPi8ZjLC6JAnQxX87d99PTR+kZ/k9Z6nQNm9V
 x0WGFJchuLQni4XDfFsGtGRZ9mYyCjTdEq5nOBG8T+RIbswMnhUDy8bhLPUdPJvI
 Ni7wAgdzO3zMr5uZO/F7sboexu5D3QU0T8Ed3vI5MfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tj2SxX
 oSa96FfDtLrh9IpSrjSWAc9uYGz+Dn9iyVoAo=; b=DTqsOZTgs9er9+yzawQmVO
 EOeS6CKr4HyuLl1Yw82EDZwnh0QHN5cjBgpXqnYBdSbWrNbwkp9N2XMK7EYX8r47
 C9HpReELYzpXVluMpuKyw3ejZ8pmHfhNErU8JqDJKz1nvBhuTMozZybUfLkRlKFy
 u2E2sWQ6Hxicg8XS8nbDcE/Gh051JO+KFaMy4eUJ+RcFWpumsnC/RfTUndRQIQ2s
 5xaHQOvXcstvWyD6/WxLpHKrjF6/I3gBVrpytWckvlOIAglOredeUiQELEYTy5zG
 +exHNkvTbt7stB1+rpKVkYMYIrThkTZfSiww74c9ZUcBd2e3p0ecO1+CynzXS5eg
 ==
X-ME-Sender: <xms:H6MBYOphsPeraZvMbHHV6sLX5m-JNpn4N51-5cOKmFM8gMm2xAOY-g>
 <xme:H6MBYMoIwGXMdtT-Fsl9-KrgVARKtOi_kXKLYdcxBmnFZjJ58f8hrFq1ckqpq6FE8
 mQPdpg_0m4q8_-tvhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:H6MBYDOSQRizwP04l9Nf6wzq-zGR4MatK7JR6FJEsLhumsMXksPkcA>
 <xmx:H6MBYN59LINByHvjPYVhqDg7R7cpfkKcmkhFOGEVIJGkFNwicaJ64Q>
 <xmx:H6MBYN7P8pv9yOTCe00vHPLOHR1qcvl-XR7wdurFxKpteNJ_AQYgUw>
 <xmx:I6MBYNDAKvlsHXR02UWThVa9nKgwADq3hUf0BbgvTdaNMMntJSZNLA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 869AA1080059;
 Fri, 15 Jan 2021 09:13:51 -0500 (EST)
Date: Fri, 15 Jan 2021 15:13:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210115141349.7oq5hwsj37qcpk5j@gilmour>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-2-maxime@cerno.tech>
 <221e5626-d97c-9d4e-07cc-e696c92ceb65@suse.de>
MIME-Version: 1.0
In-Reply-To: <221e5626-d97c-9d4e-07cc-e696c92ceb65@suse.de>
X-Mailman-Approved-At: Fri, 15 Jan 2021 22:51:40 +0000
Subject: Re: [Nouveau] [PATCH 02/10] drm: Rename plane atomic_check state
 names
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, NXP Linux Team <linux-imx@nxp.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Roland Scheidegger <sroland@vmware.com>, Inki Dae <inki.dae@samsung.com>,
 Sean Paul <sean@poorly.run>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Edmund Dea <edmund.j.dea@intel.com>, virtualization@lists.linux-foundation.org,
 Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>, linux-tegra@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, amd-gfx@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Harry Wentland <harry.wentland@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, spice-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-renesas-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: multipart/mixed; boundary="===============0001228173=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0001228173==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pc7g53zcvckyysz5"
Content-Disposition: inline


--pc7g53zcvckyysz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 15, 2021 at 02:46:36PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 15.01.21 um 13:56 schrieb Maxime Ripard:
> > diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ip=
uv3-plane.c
> > index 8a4235d9d9f1..2cb09e9d9306 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> > @@ -344,12 +344,12 @@ static const struct drm_plane_funcs ipu_plane_fun=
cs =3D {
> >   };
> >   static int ipu_plane_atomic_check(struct drm_plane *plane,
> > -				  struct drm_plane_state *state)
> > +				  struct drm_plane_state *new_state)
>=20
> It's not 'new_plane_state' ?

That function is using old_state for plane->state:

> >   {
> >   	struct drm_plane_state *old_state =3D plane->state;

Here ^

So it felt more natural to keep the convention in use in that driver

Maxime

--pc7g53zcvckyysz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAGjHQAKCRDj7w1vZxhR
xRyQAP9z6jgYoVLN5O08Gfa2bipU5kwBoAnOqoWm5tZt0atb8QEA9iY4poTgz6cv
u2lw2ErmnQLG6Rt10lvZcTmjIdOF5QI=
=AOj1
-----END PGP SIGNATURE-----

--pc7g53zcvckyysz5--

--===============0001228173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0001228173==--
