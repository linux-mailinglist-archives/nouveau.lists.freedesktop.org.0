Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C547B2E1B
	for <lists+nouveau@lfdr.de>; Fri, 29 Sep 2023 10:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418D010E6E9;
	Fri, 29 Sep 2023 08:42:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D23310E58B
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 21:40:51 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-59b52554914so19718007b3.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 14:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694727650; x=1695332450;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yg6NbhhS6bNBw/im5wDGZLYsqmgcXnTvleG//pORS78=;
 b=ViV+2MlHpvEkPYYhXwoACUOitXjJXwvQBcymKFzVQqnMsnZCyzjk8ebYv/EsvhOVsn
 qKZ8ZFEz+1XFoNE15vKWXWKKSNjOD6xhyd3YgyUi9gicDPevP2C6lgwNnBzMFHbUv67l
 kPDznnQZmBH/Mszges7xhFKpDmiqySKDXWbOKX3eITbhrXlCUoYG26CGjFXFE7TuYNpB
 UIEXzyws7VgdnZqf8Y+WNFEMQf5NArgVFfWwwmoa8bJ+6RcUf+OjROm0J9eASKu+Qots
 TkRs6zuCB1JjUoub5uye2JzrBlhN8+P6gDRC5mP8zW/ke5hIDBLSDwOBnZEG2rclHNiE
 5FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694727650; x=1695332450;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yg6NbhhS6bNBw/im5wDGZLYsqmgcXnTvleG//pORS78=;
 b=qAE6CQ5a4s0QbN/BaG9g5L6wgCaMPcyo2HXAku+mJQ97C8IfzR9OeLq0Mv2UyxbBvP
 8lvLfJc92jr9SJNN5ftShtxGPusQCS0sq8PhiFvrt+R98OvgLXpDB7ExK0OtbT9TVZWd
 nsBu0h/uz8lWYyLCzCn00+5EpjvjQEnYVMPyfK1Gg4GdHHplt5yZBmSMxe/tfCExP0Mr
 jY0bmShktcnOD4BWl5rlaTLmKiM1D653opJ7I4njlzvzbMaKD+Q9aXgI0NegsO37CXKl
 DC2InzdEufvRkJE+dXzNemHCayWUnqPfThVwcwlB0bhcmtqU8EskA5G0kocR7LK95yqw
 VVbw==
X-Gm-Message-State: AOJu0Yx05JRRj2YdFQjuX7HH8FOCDPQppbmhQZxITzFG7meVNoeZjdfH
 QjxRiTPeYfWcr+Tr0KX1XollXaSmihfWlhdcRg==
X-Google-Smtp-Source: AGHT+IHIwo1uxVWE4qpMcXDY+I8QuHt0NGAH38LuWxAvqb8Hw+peynTElFPrZBbvCY+tn1X9WNxQ4+n8wAYBwLiIEw==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:690c:d8f:b0:59b:ea96:887f with
 SMTP id da15-20020a05690c0d8f00b0059bea96887fmr125429ywb.0.1694727650404;
 Thu, 14 Sep 2023 14:40:50 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:40:49 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOF9A2UC/x2Nyw6CMBAAf4Xs2U1oSwL4K8ZDLQtuTB/Z2ioh/
 LuNt5nLzAGZhCnDtTtAqHLmGJqoSwfuacNGyEtz0L02/awGzG8JLu24CFeSjFsqjT2GWCrZgqG
 +PLoohCuL/9gGDsdZaW0mMz1GDS2dhFb+/re3+3n+AGeHtrSGAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694727649; l=1779;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=veRS+F8fLCXOEB+IwiJ2Jr1EVTbkT3rdWvzzy6w4YBI=;
 b=mxTJZ6DGijn6/IfaObu6+S9iqoBOFL/VXV+IETu4YWEw2MiDJWtx0Af8fFwoaDQuBhONmsZIu
 cVfnCIxjq5WDEKO2xTXXXVEW93KmK0oIwx+SXuNXj091829J4/96aii
X-Mailer: b4 0.12.3
Message-ID: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-core-firmware-c-v1-1-3aeae46c032f@google.com>
From: Justin Stitt <justinstitt@google.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Fri, 29 Sep 2023 08:42:15 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/core: refactor deprecated strncpy
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
Cc: nouveau@lists.freedesktop.org, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

A suitable replacement is `strscpy` [2] due to the fact that it guarantees
NUL-termination on the destination buffer without unnecessarily NUL-padding.

There is likely no bug in the current implementation due to the safeguard:
| 	cname[sizeof(cname) - 1] = '\0';
... however we can provide simpler and easier to understand code using
the newer (and recommended) `strscpy` api.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index 91fb494d4009..374212da9e95 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -79,8 +79,7 @@ nvkm_firmware_get(const struct nvkm_subdev *subdev, const char *fwname, int ver,
 	int i;
 
 	/* Convert device name to lowercase */
-	strncpy(cname, device->chip->name, sizeof(cname));
-	cname[sizeof(cname) - 1] = '\0';
+	strscpy(cname, device->chip->name, sizeof(cname));
 	i = strlen(cname);
 	while (i) {
 		--i;

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-core-firmware-c-791223838b72

Best regards,
--
Justin Stitt <justinstitt@google.com>

