Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E5A7998DF
	for <lists+nouveau@lfdr.de>; Sat,  9 Sep 2023 16:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFCF10E1A9;
	Sat,  9 Sep 2023 14:37:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C402310E1A9
 for <nouveau@lists.freedesktop.org>; Sat,  9 Sep 2023 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694270252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRcOkbLQiqXFau3Lzv+lkDuNMwp9k8LF7/IY5MKHdsU=;
 b=Ekf6PoiE+uQ9x88AYf4zRfx2CZ4HUSwTWAy6jueKhvlxWQvPU07NpxTYR4Pifoul6PvRCp
 GiAFHD4SxPQED2r3f2VACAFcB+86bf3p46XrLo6aSLKhRQyERax0G3I/JqIza5n1VqfHUR
 xKf8tK6fwiquMNSCboljOwNHaPXhXls=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-JTWCy9a1OUq8mRsPSHbpwQ-1; Sat, 09 Sep 2023 10:37:31 -0400
X-MC-Unique: JTWCy9a1OUq8mRsPSHbpwQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fbdf341934so23534815e9.3
 for <nouveau@lists.freedesktop.org>; Sat, 09 Sep 2023 07:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694270250; x=1694875050;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRcOkbLQiqXFau3Lzv+lkDuNMwp9k8LF7/IY5MKHdsU=;
 b=aWAQXzKPj0fTz9l4KGKpZx/rTDuy3bMrpJrNiQb2sOXNXCqrfa2D3lebYValob8TNO
 FKKXx5MPf/PEkiA/ZmTOKGk5+AJZgHCL2apaLDquoDSd2LAj4R8bdL+BMtUQwTc6owU5
 LIalxNLhN+c6N8jjQp4J6dgb8dom5eaqz2WWpvAIY4gaqKUSsICW/abi0RyN81L/W3wf
 KlAYeYM6vMxiu/hKmYwiR14Mu3Rl5mkGhf02WUEPoutkom/MRFfHauIo1rl44xxGDGtl
 NyHKVu0kAeYlT/rg9m2JQmL0VvyW8B0Lxk9HDpBFp2zZY1mXmG7IV4RGHa2edngpejJL
 f4LQ==
X-Gm-Message-State: AOJu0YzUUEgp1DpQntEi3IY0e2AISHWRI0JtDDaML8qI9Q6TgCsKNjm1
 BwNrvk9CZErKy4Y4IRhRQXpXrOnh5BvP7AYDB6JWovQe8FduCxdxf7gFi8hOf6hI6twcIE/Dwyq
 WrHFjovLvpEN8DHp83x1Faokrjw==
X-Received: by 2002:a05:600c:2483:b0:401:d2cb:e6f3 with SMTP id
 3-20020a05600c248300b00401d2cbe6f3mr5088939wms.1.1694270250170; 
 Sat, 09 Sep 2023 07:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuI0CHTrTRuHu7U+ySuZ17CrBG1YsmWNBf7nwWhsv6ytgzHpvaJlIL3zjF99nLHiP4wc2jkQ==
X-Received: by 2002:a05:600c:2483:b0:401:d2cb:e6f3 with SMTP id
 3-20020a05600c248300b00401d2cbe6f3mr5088899wms.1.1694270249806; 
 Sat, 09 Sep 2023 07:37:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k20-20020a7bc414000000b003fd2e898aa3sm3071184wmi.0.2023.09.09.07.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 07:37:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
Date: Sat, 09 Sep 2023 16:37:28 +0200
Message-ID: <8734znjtuf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, linux-sunxi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, etnaviv@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-stm32@st-md-mailman.stormreply.com,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@pengutronix.de, Yongqin Liu <yongqin.liu@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

Hello Uwe,

> Hello,
>
> this patch series adapts the platform drivers below drivers/gpu/drm
> to use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
>
> By changing the remove callback to return void driver authors cannot
> reasonably (but wrongly) assume any more that there happens some kind of
> cleanup later.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (53):

[...]

>   drm/imx/ipuv3: Convert to platform remove callback returning void
>   drm/ingenic: Convert to platform remove callback returning void

[...]

>   drm/mediatek: Convert to platform remove callback returning void
>   drm/mediatek: Convert to platform remove callback returning void

[...]

>   drm/msm: Convert to platform remove callback returning void

[...]

>   drm/shmobile: Convert to platform remove callback returning void

Pushed these to drm-misc (drm-misc-next). Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

