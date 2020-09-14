Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6533226905E
	for <lists+nouveau@lfdr.de>; Mon, 14 Sep 2020 17:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8456E503;
	Mon, 14 Sep 2020 15:43:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E186E4FB
 for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2020 15:34:06 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w3so58048ljo.5
 for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2020 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6QGIaljRH231VAywJdapvuATziOfA42BJnpSHpoIEVE=;
 b=RSn2RJzblwAHTSK+plrf24n4vXY7/p/jXtG+T94xADRsRUBY8CHEBNgnMf/kQyrnxy
 YieEPQGTw3bOqSmW8AmGOLLdGNA7YSDJLGbEMo+AGcNWh2pxH6XRgNcz8Cs5uCOpKkzC
 gQyRsPyGfUidZAcBfjITy0I3uSNrMpc1xEktaPuU1N5ohOzXYJc8kuUdIFaZ6+PLkH1j
 ej79ZdbMIfsu6iduHBqVwRFdln66PldWiNNCVGGJ8TfEu+jWybTfxA05D2VHpJvxymYA
 bWH+DdU6BYBQ8HP2CiwI9zxdkYMl9jJc8yEPZeyVx3GZKr3H03N+EEitFWK+0KohnbKI
 Gy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6QGIaljRH231VAywJdapvuATziOfA42BJnpSHpoIEVE=;
 b=HeYGhayP9qru5O/bobd3cnn/H0RE8hn5qQ6wcD2OV/61aZPCvHjK3lG7t5vz0mkh2C
 H4ZgOtCZ07KqKaZ28ALY/La18UeQWRYcWVaJktbEcKS2WPdjXgxfy4a/U3WZT+vEp55Z
 Xz2bcWm1ZUWa7b71mYKCKkllc8g53hUglVcrv9qH8IgmwpTe5mKNE5Hb7PMi6hhC3TAV
 jvNKDA5T0SZOVu/ibT8uJ8CLUoBlTmN9u6WG9LO0THEvM2eFdjaYM2w7qOenIQsZuApQ
 L9E+tE0OAcy2PV8esC9JoSIW3eUlYtfJFSf9ZobYCVI0H89wnlHFb2Y5c/KmFWIAM1+r
 8URQ==
X-Gm-Message-State: AOAM531t7PVpcIbA0DGFXrK20vXpL41LA2LvcVoCP5sWdtQHkadUuitj
 XpqRLQZzeiSn2rmnzRLUjF0=
X-Google-Smtp-Source: ABdhPJwhd/LhTRq+JWSW5bzIk6PAoYzRDD2WFOZyHy/0zgbs8GXUoAwbOWmbxU7cQ/01j9Vl+1ORow==
X-Received: by 2002:a05:651c:200b:: with SMTP id
 s11mr5091489ljo.196.1600097644849; 
 Mon, 14 Sep 2020 08:34:04 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:44ca:acb2:3cb7:6882:b0eb:1108])
 by smtp.gmail.com with ESMTPSA id
 l129sm3367001lfd.191.2020.09.14.08.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 08:34:04 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
 <tfiga@chromium.org>, Matt Porter <mporter@kernel.crashing.org>,
 iommu@lists.linux-foundation.org
References: <20200914144433.1622958-1-hch@lst.de>
 <20200914144433.1622958-4-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <7a1d11c2-0fc5-e110-dabe-960e516bb343@gmail.com>
Date: Mon, 14 Sep 2020 18:34:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200914144433.1622958-4-hch@lst.de>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Sep 2020 15:43:42 +0000
Subject: Re: [Nouveau] [PATCH 03/17] drm/exynos: stop setting
 DMA_ATTR_NON_CONSISTENT
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/14/20 5:44 PM, Christoph Hellwig wrote:

> DMA_ATTR_NON_CONSISTENT is a no-op except on PARISC and some mips
> configs, so don't set it in this ARM specific driver.

   Hm, PARICS and ARM capitalized but mips in lower case? :-)

> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
