Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E752C467ED0
	for <lists+nouveau@lfdr.de>; Fri,  3 Dec 2021 21:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726BB7B9D2;
	Fri,  3 Dec 2021 20:30:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 466 seconds by postgrey-1.36 at gabe;
 Tue, 30 Nov 2021 14:38:23 UTC
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527846E167
 for <nouveau@lists.freedesktop.org>; Tue, 30 Nov 2021 14:38:23 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3PlJ53SYz9w2S6
 for <nouveau@lists.freedesktop.org>; Tue, 30 Nov 2021 14:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gsz_3lNLOgpD for <nouveau@lists.freedesktop.org>;
 Tue, 30 Nov 2021 08:30:36 -0600 (CST)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3PlJ2vD2z9w2Ry
 for <nouveau@lists.freedesktop.org>; Tue, 30 Nov 2021 08:30:36 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3PlJ2vD2z9w2Ry
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3PlJ2vD2z9w2Ry
Received: by mail-pl1-f199.google.com with SMTP id
 s16-20020a170902ea1000b00142728c2ccaso8290262plg.23
 for <nouveau@lists.freedesktop.org>; Tue, 30 Nov 2021 06:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZZULR1F8PiluLDq0yfX4xdKKhgM6tyga9J4hvDhRIDI=;
 b=j98sbNp4aGJYzZQgx7/157yo3SgUnI/mMvJ0sMqD6xBYraYZ/VnSyRscyGTn1mZca0
 LnZErg2no+D58Bx5NnS5WYws9ygKRfBUJsrlHzoV/ViYsCnwhaZgB85ElPWaBNfUpe4V
 V0uC103ZW8xaFVYHWB96eff4zdXKuTIQvcX+WZXtO1+2tu58tNprNj99DOQod31ofnRz
 YBQjahbHXcA5cnNi0x2UWfo+HHu4hHiCUOTzsqYGe4tTkZApaTbrTw7XtVTn4j2R7hZL
 XI/LL44uanBqjlyUCjov1JQaJuAl+hm555ofGNNwY0mvzZD5PsAEsWH79U9IjOsdJGAE
 CEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZZULR1F8PiluLDq0yfX4xdKKhgM6tyga9J4hvDhRIDI=;
 b=HWmks+iKgFQ0sNxmboCvzTjUae+JM+2cgTfCIa3A7eavTh8NkXnqezXc6dD8L2The9
 wI5QV8NGmNkvf9Hn0ZcsDBtYZDPOAEumO6G4YovEEAQQQq7ORU3WlnVVtKVpeU44+EHF
 AaS6Gbp6wGx3H2S8RcrOgBCm39g7+ELZ2P2uVpJnVrpRJ6oiStb5bUkxd+pZQhvDc4xT
 UvM7ily4K8fjpYe6vmWTAB61Gh7CzmdFZ9ckNCTRyOLGZPAQX3UXxWyzZKlwyo0muy1M
 vJqWXlkxLXK+VGIxcrPGNjN5tQEgIwXxKvGPCSJY66+azwlo9j48H50KMGyJ2O6vdHDH
 cUHA==
X-Gm-Message-State: AOAM531HSmPNtDKQffHylU2JSSsuevANzMJP4WGZbWdegsXK5D2r+a/M
 gTn9Q7stpve5Cf/qESKdWRfoXxD3OuddfOUICmQGCu71s6ZUTR6JbMF3bkbTE/tD16I45V/p/1X
 ADmsldtAwLDj3ZW1Lqmy/498pDfeEbQ==
X-Received: by 2002:a63:a1a:: with SMTP id 26mr2298309pgk.350.1638282635544;
 Tue, 30 Nov 2021 06:30:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvVF8wTLFjolACqw+b3KkKUeaJ7DTif2YLF7D+bFqP/PZCqaQ+P5pB9IlYEV7eNa7sL2MV8g==
X-Received: by 2002:a63:a1a:: with SMTP id 26mr2298269pgk.350.1638282635156;
 Tue, 30 Nov 2021 06:30:35 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id b8sm2974809pfr.213.2021.11.30.06.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 06:30:34 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Date: Tue, 30 Nov 2021 22:30:29 +0800
Message-Id: <20211130143030.157754-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Dec 2021 20:30:00 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: Fix a wild pointer dereference in
 nouveau_connector_get_modes()
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
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In nouveau_connector_get_modes(), the return value of
drm_mode_duplicate()is assigned to mode and used in
drm_mode_probed_add(). drm_mode_probed_add() passes mode->head to
list_add_tail(). list_add_tail() will further call __list_add() and
there is a dereference of mode->head in __list_add(), which could lead
to a wild pointer dereference on failure of drm_mode_duplicate().

Fix this bug by adding a check of mode.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_NOUVEAU=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 22b83a6577eb..d960b42724de 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -977,6 +977,9 @@ nouveau_connector_get_modes(struct drm_connector *connector)
 		struct drm_display_mode *mode;
 
 		mode = drm_mode_duplicate(dev, nv_connector->native_mode);
+		if (!mode)
+			return -ENOMEM;
+
 		drm_mode_probed_add(connector, mode);
 		ret = 1;
 	}
-- 
2.25.1

