Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAD475E0D3
	for <lists+nouveau@lfdr.de>; Sun, 23 Jul 2023 11:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FF410E1FF;
	Sun, 23 Jul 2023 09:24:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF06A10E6EE
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 14:48:31 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-666eb03457cso552665b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689259711; x=1691851711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKItIj72hAMISxrHuiptAazhKs3+4zy1JRueUjGy5Ew=;
 b=YyKdOPwopqSXHjEBIrGYsVPmAu3FY7cR+8fObyB2rYI5ApMGmpMMr6bUFj5r1IDt6v
 znbq9k7zRuyzRX0KqKbX/5lwQaKMh7xl4ny+o8681QvyK/KOpOURI29pvgV8Nk5oVzbq
 iMUr6N+hUdvxrP0Yl3OD6rz60kDH8sVtvOI5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689259711; x=1691851711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKItIj72hAMISxrHuiptAazhKs3+4zy1JRueUjGy5Ew=;
 b=QOnfoBeFLe6H5OvU+juO6P/mMELCQL5x+swWE0shPSSK37g4hNAHjWtyZBgiyuI5gj
 CGY+jB3X/uXSfjHnsE5SLfywUi3+jjk3BU5EmQFdh4AIy+FdtwN7jIvHoMWFathxrs6x
 fQco4PO9bWMl6jUFtcH+5OFindaYkkulkHur3aZo5WDMKQ//wQZx3aZfr/4p/cfLIAqZ
 KUOR5utr6KHF5o3G2vWvcXIg+VyfA4sSdk5rC5B6WwVQQeApEmYStN1dOHH03yxbtYeG
 KmNAhnuh5rYPThoIV6sxD98OFfvxZtCzdrBdouuBibaWGDqU1EUoLilcWxCSpTFVS5QE
 Xcbg==
X-Gm-Message-State: ABy/qLa5lvo2giGdDqWAHADKhnPI1AGkaEC5i4Q5ICdv+/jhIyyifKwu
 N+YIDFWJPDSo0hA/9DPSLf/kBY57R/EY0Q0jHfwmyg==
X-Google-Smtp-Source: APBJJlFSEy4t1OzuyMRQFBDG4hT9/3FHgCXOqa1yPNb9Ky7owMmJEdpMmg8zeJtT7ZY1xFH3vR6ujw==
X-Received: by 2002:a05:6a00:cc8:b0:676:eb8d:e3bc with SMTP id
 b8-20020a056a000cc800b00676eb8de3bcmr1703133pfv.22.1689259710844; 
 Thu, 13 Jul 2023 07:48:30 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com.
 [209.85.214.172]) by smtp.gmail.com with ESMTPSA id
 m22-20020aa78a16000000b00682b3d14005sm5574313pfa.87.2023.07.13.07.48.30
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 07:48:30 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1b8bbcfd89aso4549505ad.1
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 07:48:30 -0700 (PDT)
X-Received: by 2002:a05:6902:211:b0:c8b:3:e399 with SMTP id
 j17-20020a056902021100b00c8b0003e399mr1398441ybs.44.1689259342555; Thu, 13
 Jul 2023 07:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
In-Reply-To: <20230713130337.fd2l67r23g2irifx@pengutronix.de>
From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 13 Jul 2023 10:41:45 -0400
X-Gmail-Original-Message-ID: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
Message-ID: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 23 Jul 2023 09:23:50 +0000
Subject: Re: [Nouveau] [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename
 struct drm_crtc::dev to drm_dev
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
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Matt Roper <matthew.d.roper@intel.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-sunxi@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>, Tim Huang <Tim.Huang@amd.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Dave Airlie <airlied@redhat.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin <zackr@vmware.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, David Francis <David.Francis@amd.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Aaron Liu <aaron.liu@amd.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-rockchip@lists.infradead.org,
 Fangzhi Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Tian Tao <tiantao6@hisilicon.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 Swati Sharma <swati2.sharma@intel.com>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, Emma Anholt <emma@anholt.net>,
 Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Chia-I Wu <olvaffe@gmail.com>,
 Alan Liu <haoping.liu@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mikko Perttunen <mperttunen@nvidia.com>,
 Yifan Zhang <yifan1.zhang@amd.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 John Stultz <jstultz@google.com>, Roman Li <roman.li@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sam Ravnborg <sam@ravnborg.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Liu Shixin <liushixin2@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Marek Vasut <marex@denx.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Lang Yu <Lang.Yu@amd.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Lechner <david@lechnology.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 amd-gfx@lists.freedesktop.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-mips@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Drew Davenport <ddavenport@chromium.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 9:04=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> hello Sean,
>
> On Wed, Jul 12, 2023 at 02:31:02PM -0400, Sean Paul wrote:
> > I'd really prefer this patch (series or single) is not accepted. This
> > will cause problems for everyone cherry-picking patches to a
> > downstream kernel (LTS or distro tree). I usually wouldn't expect
> > sympathy here, but the questionable benefit does not outweigh the cost
> > IM[biased]O.
>
> I agree that for backports this isn't so nice. However with the split
> approach (that was argumented against here) it's not soo bad. Patch #1
> (and similar changes for the other affected structures) could be
> trivially backported and with that it doesn't matter if you write dev or
> drm (or whatever name is chosen in the end); both work in the same way.

Patch #1 avoids the need to backport the entire set, however every
change occuring after the rename patches will cause conflicts on
future cherry-picks. Downstream kernels will have to backport the
whole set. Backporting the entire set will create an epoch in
downstream kernels where cherry-picking patches preceding this set
will need to undergo conflict resolution as well. As mentioned in my
previous email, I don't expect sympathy here, it's part of maintaining
a downstream kernel, but there is a real cost to kernel consumers.

>
> But even with the one-patch-per-rename approach I'd consider the
> renaming a net win, because ease of understanding code has a big value.
> It's value is not so easy measurable as "conflicts when backporting",
> but it also matters in say two years from now, while backporting
> shouldn't be an issue then any more.

You've rightly identified the conjecture in your statement. I've been
on both sides of the argument, having written/maintained drm code
upstream and cherry-picked changes to a downstream kernel. Perhaps
it's because drm's definition of dev is ingrained in my muscle memory,
or maybe it's because I don't do a lot of upstream development these
days, but I just have a hard time seeing the benefit here.

I appreciate your engagement on the topic, thank you!

Sean

>
> Thanks for your input, best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
