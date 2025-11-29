Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22040CBA8EE
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A032E10E40D;
	Sat, 13 Dec 2025 12:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgH1xA/m";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5699D10E117
 for <nouveau@lists.freedesktop.org>; Sat, 29 Nov 2025 14:16:05 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5957ac0efc2so2974919e87.1
 for <nouveau@lists.freedesktop.org>; Sat, 29 Nov 2025 06:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764425763; x=1765030563; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CCb0Eqo5GqhxN4l/mvqQ6jrTkxIuERyWVn+iJxuMgs0=;
 b=AgH1xA/mmxpYX8GQhQFVZEWLWj1fvBJw/nCHWOj6sW7OLfiARU6eZjDcKVhyCE9oJN
 xgjE2qxzh2KW4MneLWuzrZcBvhxWUbo7Klobol51s9Z/nEgTQjsjPnXYiC+DwRsK+z/j
 aeDsvf3zs/eZ21DQwkUyaXG5vVWOc6NrRa1RgDPbgYu7wEvvADtCsnhgv0NvtJHK3ObZ
 xdBNIKbJmNkwEehYCrvPW90TqoutBUdl2dB6Mt9E5wHsK8L+4iZRMLnitmXFv9WINmQy
 C8bRW1O93vWycaW7wAICesA9wsYeCq04M1GRjWUdYsPQqzmVl/t/wqBuRMtzVlP5Na/U
 4Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764425763; x=1765030563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCb0Eqo5GqhxN4l/mvqQ6jrTkxIuERyWVn+iJxuMgs0=;
 b=vy+jw9V78QCA8LogjhBG+nmQZF0RmuKVo/gWwuFVerPz0+6eu+IHcZGYtHEEAhkeH7
 TXOeRZOag5jiwpLgnCi73xL1dGUBv+r/piWc6kxrMGSnv9PaJP1qpyxIGqHbyWDMAR7s
 6qxmtXGKHfQwQt2+Fh/w+/rfE0/Vk9bpbHx26eOYoC8FIoCA4b1RDA/qI/zu9ziLnwma
 0OQSSDW3dCdpJ++mdp91BofOrnd8bkwxdgSSqQrxI9FsiQ/jITPjP2JXPreMAMH1CZB4
 gZeuScdS4d5NakisOdV3oql6h3pgmVpPRvjHbdFIfq6w+JaV4gmFaVAZrSNGXjPchEVz
 rMvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5kq0TKmFGhqzzPRW+a0d0CFZdsExl185sNrkmSOeRdLH0BzKaEIwCjyu8UA5TYa3Vco97sA2W@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNytekgm8rj/XWh7GxhQAlUMyCfDId0gv/xow9QIXEaZiMHsPt
 NcwZBVFYNtS/moamv85CHwkzX+RA7jXQjTrHmwNnt6rIlX2qHl4921B8
X-Gm-Gg: ASbGncvsHpAaA8yhuQCew+reXRcNikhTuGZoyFo++rLrCZf/BRTfUn7gYLP/Lu4A9Ql
 LthNVM+h9/CT/Lwz6l9k+np2VTXqm4/dzdOX4H9D3pw4T2laDeZaTD7jotw09ne0t0Dx1hspsKh
 uHQcoO+3hDo7gflnLlk5jL8+WrDTrGeSbvZDZFoJ4/PSCs2wDimtLg8wS13DwMUcFRnxqV4H7uf
 i3UIikOZbwk3rGY9MRSbYFCQVAhDEL8Jpwr83KWxRPqfjMG5aoDdvIW5PFX2R23uSwbyOb1oF0Q
 luIfdNItz96g9l8R4CaDLcpgDWAu0ea8jcJ1r8agEAxyp5DMd/hz7HEJCxeBfzI4aTeG7n5Syyq
 wCZ2kXPSWJp1z+6UDqt+P93rBbtGYQ0fm7CV1LZEns37ezOVOWy35tIHdcS5iGm5hrNhgnGiNEo
 9CLc2WbVyt0gvUkLaDP6/JMy+BvOXt4C7WY7wRhWNiTOdY1DTx8fbMPomxxRY=
X-Google-Smtp-Source: AGHT+IEA3WrHgp5ecEMKNm9JiVdtpzxk9v/x2/vTeR8RniWcj0S+d7R5TzjjaIhv5WRyeSx0oFzvMg==
X-Received: by 2002:a05:6512:23a1:b0:594:36b3:d1fa with SMTP id
 2adb3069b0e04-596a3ed471fmr11203155e87.29.1764425763064; 
 Sat, 29 Nov 2025 06:16:03 -0800 (PST)
Received: from home-server.lan (89-109-48-215.dynamic.mts-nn.ru.
 [89.109.48.215]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bfa43f33sm1945600e87.49.2025.11.29.06.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 06:16:02 -0800 (PST)
From: Alexey Simakov <bigalex934@gmail.com>
To: bskeggs@redhat.com
Cc: Alexey Simakov <bigalex934@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Francisco Jerez <currojerez@riseup.net>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Alexandr Sapozhnikov <alsp705@gmail.com>
Subject: 
Date: Sat, 29 Nov 2025 17:14:40 +0300
Message-Id: <20251129141438.8789-1-bigalex934@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:17:04 +0000
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Date: Sat, 29 Nov 2025 17:06:57 +0300
Subject: [PATCH v2] drm/nouveau: fix div-by-zero in nouveau_bo_fixup_align

The expression 64 * nvbo->mode can be zero when nvbo->mode equals
U32_MAX / 64, causing a division by zero in do_div(). Values greater
than U32_MAX / 64 cause a u32 overflow, leading to incorrect results.

Since nvbo->mode comes from userspace via ioctl, it must be validated
to prevent crashes or undefined behavior.

Add a check to ensure nvbo->mode is less than U32_MAX / 64
before use in multiplication.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: a0af9add499c ("drm/nouveau: Make the MM aware of pre-G80 tiling.")
Co-developed-by: Alexandr Sapozhnikov <alsp705@gmail.com>
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
Signed-off-by: Alexey Simakov <bigalex934@gmail.com>
---

v2 - move value check at the begining of nouveau_bo_alloc for
preventing execution of function for case, when tile_mode is too large

link to v1: https://lore.kernel.org/dri-devel/20251022041302.13-1-alsp705@gmail.com/

 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 96a8b7b1215e..774888ffa4a8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -207,6 +207,9 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	struct nvif_vmm *vmm = cli->svm.cli ? &cli->svm.vmm : &cli->vmm.vmm;
 	int i, pi = -1;
 
+	if (tile_mode > U32_MAX / 64)
+		return ERR_PTR(-EINVAL);
+
 	if (!*size) {
 		NV_WARN(drm, "skipped size %016llx\n", *size);
 		return ERR_PTR(-EINVAL);
-- 
2.34.1

