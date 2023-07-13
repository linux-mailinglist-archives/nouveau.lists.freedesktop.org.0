Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83575E0C7
	for <lists+nouveau@lfdr.de>; Sun, 23 Jul 2023 11:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0BF10E1F8;
	Sun, 23 Jul 2023 09:23:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E7F10E663
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 09:54:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJt1s-0003Ts-Kn; Thu, 13 Jul 2023 11:54:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJt1o-00E5Pf-9q; Thu, 13 Jul 2023 11:54:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJt1n-004WRt-D8; Thu, 13 Jul 2023 11:54:27 +0200
Date: Thu, 13 Jul 2023 11:54:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230713095427.swf7unzca4ahipsk@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <20230712161025.22op3gtzgujrhytb@pengutronix.de>
 <878rbkgp4m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qeweu3qcdjoypth2"
Content-Disposition: inline
In-Reply-To: <878rbkgp4m.fsf@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Sun, 23 Jul 2023 09:23:50 +0000
Subject: Re: [Nouveau] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Liu Shixin <liushixin2@huawei.com>, linux-samsung-soc@vger.kernel.org,
 Drew Davenport <ddavenport@chromium.org>, Samuel Holland <samuel@sholland.org>,
 Matt Roper <matthew.d.roper@intel.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 linux-sunxi@lists.linux.dev, Tim Huang <Tim.Huang@amd.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Hersen Wu <hersenxs.wu@amd.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 amd-gfx@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, David Francis <David.Francis@amd.com>,
 Aaron Liu <aaron.liu@amd.com>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
 Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Sandy Huang <hjc@rock-chips.com>, Swati Sharma <swati2.sharma@intel.com>,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 linux-hyperv@vger.kernel.org, Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alan Liu <haoping.liu@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, intel-gfx@lists.freedesktop.org,
 Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Roman Li <roman.li@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Marek Vasut <marex@denx.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Uma Shankar <uma.shankar@intel.com>,
 Mika Kahola <mika.kahola@intel.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Lechner <david@lechnology.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 =?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-tegra@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, John Stultz <jstultz@google.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--qeweu3qcdjoypth2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 12:03:05PM +0300, Jani Nikula wrote:
> On Wed, 12 Jul 2023, Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> =
wrote:
> > Hello Jani,
> >
> > On Wed, Jul 12, 2023 at 05:34:28PM +0300, Jani Nikula wrote:
> >> On Wed, 12 Jul 2023, Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.d=
e> wrote:
> >> > Hello,
> >> >
> >> > while I debugged an issue in the imx-lcdc driver I was constantly
> >> > irritated about struct drm_device pointer variables being named "dev"
> >> > because with that name I usually expect a struct device pointer.
> >> >
> >> > I think there is a big benefit when these are all renamed to "drm_de=
v".
> >> > I have no strong preference here though, so "drmdev" or "drm" are fi=
ne
> >> > for me, too. Let the bikesheding begin!
> >> >
> >> > Some statistics:
> >> >
> >> > $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort |=
 uniq -c | sort -n
> >> >       1 struct drm_device *adev_to_drm
> >> >       1 struct drm_device *drm_
> >> >       1 struct drm_device          *drm_dev
> >> >       1 struct drm_device        *drm_dev
> >> >       1 struct drm_device *pdev
> >> >       1 struct drm_device *rdev
> >> >       1 struct drm_device *vdev
> >> >       2 struct drm_device *dcss_drv_dev_to_drm
> >> >       2 struct drm_device **ddev
> >> >       2 struct drm_device *drm_dev_alloc
> >> >       2 struct drm_device *mock
> >> >       2 struct drm_device *p_ddev
> >> >       5 struct drm_device *device
> >> >       9 struct drm_device * dev
> >> >      25 struct drm_device *d
> >> >      95 struct drm_device *
> >> >     216 struct drm_device *ddev
> >> >     234 struct drm_device *drm_dev
> >> >     611 struct drm_device *drm
> >> >    4190 struct drm_device *dev
> >> >
> >> > This series starts with renaming struct drm_crtc::dev to drm_dev. If
> >> > it's not only me and others like the result of this effort it should=
 be
> >> > followed up by adapting the other structs and the individual usages =
in
> >> > the different drivers.
> >>=20
> >> I think this is an unnecessary change. In drm, a dev is usually a drm
> >> device, i.e. struct drm_device *.
> >
> > Well, unless it's not. Prominently there is
> >
> > 	struct drm_device {
> > 		...
> > 		struct device *dev;
> > 		...
> > 	};
> >
> > which yields quite a few code locations using dev->dev which is
> > IMHO unnecessary irritating:
> >
> > 	$ git grep '\<dev->dev' v6.5-rc1 drivers/gpu/drm | wc -l
> > 	1633
> >
> > Also the functions that deal with both a struct device and a struct
> > drm_device often use "dev" for the struct device and then "ddev" for
> > the drm_device (see for example amdgpu_device_get_pcie_replay_count()).
>=20
> Why is specifically struct drm_device *dev so irritating to you?
>=20
> You lead us to believe it's an outlier in kernel, something that goes
> against common kernel style, but it's really not:
>=20
> $ git grep -how "struct [A-Za-z0-9_]\+ \*dev" | sort | uniq -c | sort -rn=
 | head -20
>   38494 struct device *dev
>   16388 struct net_device *dev
>    4184 struct drm_device *dev
>    2780 struct pci_dev *dev
>    1916 struct comedi_device *dev
>    1510 struct mlx5_core_dev *dev
>    1057 struct mlx4_dev *dev
>     894 struct b43_wldev *dev
>     762 struct input_dev *dev
>     623 struct usbnet *dev
>     561 struct mlx5_ib_dev *dev
>     525 struct mt76_dev *dev
>     465 struct mt76x02_dev *dev
>     435 struct platform_device *dev
>     431 struct usb_device *dev
>     411 struct mt7915_dev *dev
>     398 struct cx231xx *dev
>     378 struct mei_device *dev
>     363 struct ksz_device *dev
>     359 struct mthca_dev *dev
>=20
> A good portion of the above also have a dev member.

Yeah, other subsystems and drivers have the same problem. You're lucky
that I noticed drm first and invested some effort to improve it. IMHO
other subsystems being bad shouldn't stop drm to improve here.

And note that for example for pci_dev there are 5794 instances that are
named "pdev" and there are 9971 struct platform_device that are called
"pdev", too. So the majority for these does it better. And agreed,
net_device and others are also inconsistent. If you want an area that is
better, look at the naming of i2c_client or spi_device. (And take into
account that these are spread all over the tree and so are not in
control of a single maintainer team.)

> Are you planning on changing all of the above too, or are you only
> annoyed by drm?

Would you be more welcoming if I promised to tackle some of the above,
too? If so: I might. I hesitate a bit because I didn't suffer from the
others. (Apart from asking ctags for "dev" is a nightmare.)

And regarding the second part of your question: I was annoyed by drm
because that was the one that offended me while researching a problem in
a drm driver. And the variable/struct member name irritated me enough to
believe that with consistent naming I would have found it quicker.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qeweu3qcdjoypth2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSvydIACgkQj4D7WH0S
/k4hjAgAozFp653NVzmkpE7aXTRWhbDCNL3DGT9ODtF01d4F5Hj7wJVIryc1iT+i
pKEV3mhZKNm6WpaQU9OtvO3zdC2E6lx4+fyvWXNW9JpRVgekEPJyl60rXGhU8fuN
pghoNgpFQ2LJFVA81cUXRwu81TZBU3fMt/EUn6f4skEG0QVCIdVZNP8w5W9+5g5P
ZTx8I6TkHDjubT+sZeYiWn1FQxah3EU9o9rk6Bj8aa61vJOuDKXo3NTSLN78Aitl
e0aR9Ro4Vfdg3XW5b52IGHn+Sg8dzYClC4kPBBQtdUao8U6CO8hW7w9+pNraKIV8
T5zOCDUDryMjbJbNfnD2SSquB7gVlw==
=7d5L
-----END PGP SIGNATURE-----

--qeweu3qcdjoypth2--
