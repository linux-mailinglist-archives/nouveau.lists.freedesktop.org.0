Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78C17373DD
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 20:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0785210E359;
	Tue, 20 Jun 2023 18:20:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF5F10E595
 for <nouveau@lists.freedesktop.org>; Thu,  8 Jun 2023 16:55:38 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-75eb918116aso64853785a.3
 for <nouveau@lists.freedesktop.org>; Thu, 08 Jun 2023 09:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686243337; x=1688835337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmEOm3Skn8Jl/sRC6hqqJWkitptFK5F761thwbnVCkg=;
 b=iV1uwAsMuAUpeFkiaFfmllKrsZVx0QEkXeLKvVYK1pB15ZzxbUh0dw/DvNUQWg9+ok
 /HRnZTq0ENkADK5fFosgdVUQb2NfBqch5h9Bwrd3elgNcYqIHsCM2LZ3x2Y7KfxEIV2w
 RwH+nvilnzwjWV4u3n9jFBwvNS4xwHUmNwmD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686243337; x=1688835337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmEOm3Skn8Jl/sRC6hqqJWkitptFK5F761thwbnVCkg=;
 b=l5ejzdLitKwgsgNHNVKvRnBRSXMgfoWo6g2y8r6+JaRCMM9H94brbjpligAyQMEbmJ
 xMXlGsxsIpfZasU++mIgFhKvhIlIjB1ilxgeht2KbIe1JjqDvUUGgpNFf94iiLC5AJsp
 LeIcirsm0x2J4pRICp0Fup8TiQSfdXppjkhUW7UTQkd+PdAD4DgWj0Bb77gefx8vkwDv
 nMj9RI/0jEsi1py2GWEKsHPoATtYaMu0LsdMYjgQqmJW1QUlL5zYQeuwpsRgsfTMQGA1
 /o/QHkZ0o+GNx8GUQlu6/Ch2ohpI2iNNi5JLqpE6Y9G993kHQh7FbaWwt4A1UIB5YMC2
 9fSQ==
X-Gm-Message-State: AC+VfDxz+YQO4rFAHvu1RD3OoYpev0pS42Ort30vPr6LQ/fykeLcuOz3
 19WkcBUHCxpCYyru0ZIiX47/jlrYZRh24zNbNL7ISw==
X-Google-Smtp-Source: ACHHUZ7cwx3fI/GtIn2w0tWbm63MynvZHjerYaoDwoHq5SlSWcWIy+Ex3w2VXae0vMCVAnINDma9bQ==
X-Received: by 2002:a05:620a:f86:b0:75b:23a0:e7d9 with SMTP id
 b6-20020a05620a0f8600b0075b23a0e7d9mr4708836qkn.58.1686243337183; 
 Thu, 08 Jun 2023 09:55:37 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05620a12e600b0075785052e97sm443548qkl.95.2023.06.08.09.55.36
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 09:55:36 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-3f98276f89cso186641cf.1
 for <nouveau@lists.freedesktop.org>; Thu, 08 Jun 2023 09:55:36 -0700 (PDT)
X-Received: by 2002:a05:6e02:18ca:b0:33b:68fb:ea0 with SMTP id
 s10-20020a056e0218ca00b0033b68fb0ea0mr145479ilu.26.1686242834959; Thu, 08 Jun
 2023 09:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230608162642.GA23400@pendragon.ideasonboard.com>
In-Reply-To: <20230608162642.GA23400@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 09:47:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vwz9+jhZ94DvagVyAq=4TtWLMEVLRi8rTKaishoPQEfw@mail.gmail.com>
Message-ID: <CAD=FV=Vwz9+jhZ94DvagVyAq=4TtWLMEVLRi8rTKaishoPQEfw@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 20 Jun 2023 18:20:11 +0000
Subject: Re: [Nouveau] [PATCH 00/53] drm: Convert to platform remove
 callback returning void
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
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, NXP Linux Team <linux-imx@nxp.com>,
 Miaoqian Lin <linmq006@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 linux-rockchip@lists.infradead.org, Ben Skeggs <bskeggs@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Alain Volmat <alain.volmat@foss.st.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yuan Can <yuancan@huawei.com>, Stefan Agner <stefan@agner.ch>,
 Michal Simek <michal.simek@xilinx.com>, linux-tegra@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh@kernel.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Guo Zhengkui <guozhengkui@vivo.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liu Shixin <liushixin2@huawei.com>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>,
 Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Clark <robdclark@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Melissa Wen <mwen@igalia.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 8, 2023 at 9:26=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> > The following ones appeared to apply to the top of drm-misc-next, but
> > I didn't apply them since get_maintainer didn't say they were part of
> > drm-misc-next:
> >
> > drm/tiny: Convert to platform remove callback returning void
> > drm/tilcdc: Convert to platform remove callback returning void
> > drm/sprd: Convert to platform remove callback returning void
> > drm/shmobile: Convert to platform remove callback returning void
> > drm/rcar-du: Convert to platform remove callback returning void
>
> If you don't mind, could you take the rcar-du patch through drm-misc too
> ? I don't plan to send another pull request for v6.5.

Done.

2510a2579324 drm/rcar-du: Convert to platform remove callback returning voi=
d
