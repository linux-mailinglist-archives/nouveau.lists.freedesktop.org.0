Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CAA5AF616
	for <lists+nouveau@lfdr.de>; Tue,  6 Sep 2022 22:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA3710EAAE;
	Tue,  6 Sep 2022 20:32:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A4B10E171
 for <nouveau@lists.freedesktop.org>; Mon, 29 Aug 2022 19:02:46 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id e28so6902106qts.1
 for <nouveau@lists.freedesktop.org>; Mon, 29 Aug 2022 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=pIxGeluzGYEKzBZac878nAVYb/MGQD02kaqzGhI5soE=;
 b=grYLPBfbpBFgKFqkSlWko72q8lwjufsjsE/1/jVNSz8M51ZLimPU4INaXeTpCGwbqu
 fpARIQTikb4m+fTiEvbEdTOUsCbm87y6kmK0y/IzPpe+uumC/F4xqZdfNn2rlMbsyY/j
 2ZgKYd/EfMOVNwJaLRlFuQfRnSWEgfHVdHM7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=pIxGeluzGYEKzBZac878nAVYb/MGQD02kaqzGhI5soE=;
 b=GByAFqX8ecd25h1E0XWHeCkNPGvsTcRafyxmLu8jeb1QPl21fgV6kJbKU+x0BBEnU5
 IRUCCDQd5Kp1ME/fh/A/c0pDX7UKvgVZh0bdSmEtxw5WTjrmWh5zFe8/nYEHA2jZBZbs
 xjLUw5KXEmrNVAQ3KcJm2q1FDuB2MWcAId5ynHE0/ID6WmKszh7gWcO/WoYUFumLeyvy
 4o4HulECLBLc1oCD9HYnJEPcywMin0wCDD33jZABTtePg3BXIVUGkpqm5gkr6Sw7hv0b
 M+P/0lFyjY0W/9NAjKPlJmxYtcmcDQTvbXJkP95RitngzsSW1MpYwqoC7TL/R8xC5rK+
 42sA==
X-Gm-Message-State: ACgBeo3at1NSj95RB4a6VqJDoleY+sl5EU+tE8wH1aL2uSPyrDQESHsE
 lLnD/q1x0B9wEN6UIYVL+zi1lg==
X-Google-Smtp-Source: AA6agR7cohvIoKMHY1SJ+uPe6QOIMSrdGY61QE9x43N6PZX9CYY3REZteRsH6f6P7prXXMGQNDmESg==
X-Received: by 2002:a05:622a:14cd:b0:344:6cfa:42f9 with SMTP id
 u13-20020a05622a14cd00b003446cfa42f9mr11639737qtx.147.1661799765067; 
 Mon, 29 Aug 2022 12:02:45 -0700 (PDT)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
 by smtp.gmail.com with ESMTPSA id
 t17-20020ac86a11000000b0031f287f58b4sm5405223qtr.51.2022.08.29.12.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:02:44 -0700 (PDT)
Date: Mon, 29 Aug 2022 15:02:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Message-ID: <20220829190242.tk2hinttzzmzhnaj@meerkat.local>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-1-459522d653a7@cerno.tech>
 <f6289e5d-98e3-1a0d-f514-136e2b7978c1@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6289e5d-98e3-1a0d-f514-136e2b7978c1@tronnes.org>
X-Mailman-Approved-At: Tue, 06 Sep 2022 20:31:03 +0000
Subject: Re: [Nouveau] [PATCH v2 01/41] drm/tests: Order Kunit tests in
 Makefile
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <maxime@cerno.tech>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Aug 29, 2022 at 08:46:42PM +0200, Noralf Trønnes wrote:
> Something has gone wrong with this patchset, there are double line endings.

I noticed this, too, and I think the reason is because these patches were
generated with "b4 send -o", but actually sent using git-send-email. It's not
a use-case I've considered (or tested) and the breakage is because when b4
generates patches with "-o", they are written with CRLF line endings, which is
not something git-send-email expects.

Maxime, any reason you went this direction instead of just letting b4 send
these patches directly?

-K
