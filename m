Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10462D39021
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 18:42:27 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0665510E0F7;
	Sat, 17 Jan 2026 17:42:25 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D449844CA7;
	Sat, 17 Jan 2026 17:33:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768671226;
 b=l0RaaGfy6i60FO+MsuZTGq96wRO+g/MT9I3MYrSn7oowHMzoZ12TdsrM1oT6JfE6dW+uS
 7wo/tMa3tn2KaKtfdFC4DAsfuPp8zZX+rqawI/5Uvk3PwrVX61wbZqrUmwsyjGnCcLxfwFk
 cqHQ4u/+/ZZeXeEw/1XVQ4AxkpEyMmnZssAKn5X1z46l7SeRZktZcfwhxa5TLTY1SD/jIaf
 IsmpU/YPGy5mbwtQRYT9jh6bVJwAFIW8o75iXV9qVVw0Tjilx6FbQ8dKh5xSk3eI0PxcCrl
 Ni6h6DHdsNmQZ8YlI2yaVfYge3je4FLMDH5YkoXOXgUqvJ10FyYCImnkl/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768671226; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xkMQUtuWqe+eERkT5Pu3V7ISmmNsJeHtvh3KWYxLyqE=;
 b=oRpi4mGN3SOe5Aq6JtbultSfIv7ZLC3h9cMBEpN2hfr7E5R/pOijFXwRZeQB1pt5ZkgJ8
 PH5g+CfqGHUGdIBoEKbjCopmq6Z3+EbXy7fRD4bb+mOdqVK8pMhiLYi9CVZaMEUJ06YVkRS
 ngaZPQmWXMY9Jm7R3H0tl/DUcQF0JoNj65XcZP3i2Fb8TzrdtiP21tzoUw6omougdbMQTJc
 J795a/O4SUdyrZ3imS0l/54AgjybnUmBczFvpYu8GgioPbz8in6IGKtQg16LUdZeXyLE0rr
 ApHtQodo3IqedZYJno0QVX1yQ+VfrJD856Ox97xbDh0qh+/7uiuYhhsQMn6Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3FED244B97
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 14:06:51 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D4EFF10E0C2
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 14:15:28 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b802d5e9f06so405424366b.1
        for <nouveau@lists.freedesktop.org>;
 Sat, 17 Jan 2026 06:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768659327; x=1769264127;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xkMQUtuWqe+eERkT5Pu3V7ISmmNsJeHtvh3KWYxLyqE=;
        b=N/Yt8X6lfAppxdZrfNf8BDb4f8yKfgHFB69mgk8iQtkFdztEVdK/JMwAK9dmnjfynm
         JvTQavJWjJ7JS6VLWHX3EI9v6a/s5yQ0oTRYuVGc5QziEqiI+HaUr4wKxo+NCeYxA9iq
         Y482mu7uinPcqwUayTCT8KUlEm15q3Za2jbvAuvt1ysy10bg8LHmMlKBWmV18bhjJIhF
         T9gfaw70AkW1rgeCEHd6b3xDLVG43WTjmK3lP2bsQy46AIXk2pyyoSSckQ3c9no/dUQm
         nSzqcarSSN30iwMkTfcHekXtFtU1mPR37VbrlhylASD36TPS9AhJBuUFcyYnxLcrGs6a
         vHbA==
X-Gm-Message-State: AOJu0YwPRxTjbBNgfXHyeecVb1rCaE8kiqCcV6VZEurNxpx/8mg+5BmL
	NUDuwA8J9u+BQ8qs5DEKOXoNGwXgtVeef9GmulRwjDJW1QFqwITr315Ci4gP4JH92eI=
X-Gm-Gg: AY/fxX73D9ZzKOVloJnh6qh8mCKcz67YtMhd5lP2qPOSxNdyJcMWNNUV1oFBUeYUFlY
	uwEecT7x6/WHFZ0Qk60FELhK8xbK7odwm+GMeWVg43/Ekq+Jz0hcfzqGytyOCGtZaG0RMXVMUSZ
	mIWy2/yed3gzmHA90o/yhfQCXxmuGSCiZFh+5r55RAQqqX1phZXn/FCZn4Zcx0YD/V8CQaqVTCo
	TCqueKCMUYdw8qQGzZc6wxU+eISj/mLVP/Iwpk0/Dr2iSF95vveYm0NYVtgON4XEoXo/CsU/Fvo
	hT73+3OLmFqY4HNhcUouwUgOm+r25wSPh2xlWn6hcSz98HXqAtd15vBIwxkhIfEex0KEHOR48N0
	aVvnx4yZuXOXL0rYV7gweo9ovUPnj43IZOgPWsL4zY+GxGpxl3LdMVCrWXRDxAZi+Zf7btHPTOc
	iqjbOk2YQURI+Swg==
X-Received: by 2002:a17:907:74e:b0:b83:972c:77fe with SMTP id
 a640c23a62f3a-b8792d3be19mr504973266b.2.1768659326724;
        Sat, 17 Jan 2026 06:15:26 -0800 (PST)
Received: from linux-gentoo ([158.47.224.235])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959fbb38sm533862466b.52.2026.01.17.06.15.25
        for <nouveau@lists.freedesktop.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 06:15:26 -0800 (PST)
Date: Sat, 17 Jan 2026 15:15:24 +0100
From: Giuseppe Ranieri <giuseppe@ranieri.dev>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] Fix scdc implementation missing in GK208B NVidia Card
 (gk104_sor_hdmi)
Message-ID: <aWuZfMo5cMLwNRax@linux-gentoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-MailFrom: rgiuse@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 3LUGKQNV5PFYSHS55GAKP4KWU46U5TTR
X-Message-ID-Hash: 3LUGKQNV5PFYSHS55GAKP4KWU46U5TTR
X-Mailman-Approved-At: Sat, 17 Jan 2026 17:33:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3LUGKQNV5PFYSHS55GAKP4KWU46U5TTR/>
Archived-At: <https://lore.freedesktop.org/aWuZfMo5cMLwNRax@linux-gentoo/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


I fixed a problem for the GK208B NVidia Card (GT710): 
the initialization was broken my card support scdc channel but the implementation was missing.

The problem was tracked by Mathias Anselmann in
https://bugzilla.kernel.org/show_bug.cgi?id=219561 and https://gitlab.freedesktop.org/drm/nouveau/-/issues/402

This patch fix the card initialization and fix audio problem on my card GK208B  
the code path is shared by 
nouveau/nvkm/engine/device/base.c- .name = "GK110",
nouveau/nvkm/engine/device/base.c- .name = "GK110B",
nouveau/nvkm/engine/device/base.c- .name = "GK208B",
nouveau/nvkm/engine/device/base.c- .name = "GK208",

I have done another patch so the code don´t broke anymore the initialization if the scdc implementation is missing when supported by the card. It will raise a DBG message instead.


Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
---

diff '--color=auto' -ur a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c	2025-11-30 23:42:10.000000000 +0100
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c	2026-01-16 19:03:51.175827296 +0100
@@ -106,6 +106,7 @@
 const struct nvkm_ior_func_hdmi
 gk104_sor_hdmi = {
 	.ctrl = gk104_sor_hdmi_ctrl,
+	.scdc = gm200_sor_hdmi_scdc,
 	.infoframe_avi = gk104_sor_hdmi_infoframe_avi,
 	.infoframe_vsi = gk104_sor_hdmi_infoframe_vsi,
 };
 
