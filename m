Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793707AE373
	for <lists+nouveau@lfdr.de>; Tue, 26 Sep 2023 03:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCFA10E342;
	Tue, 26 Sep 2023 01:49:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F74A10E343
 for <nouveau@lists.freedesktop.org>; Tue, 26 Sep 2023 01:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695692959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=77DcS0RLex3b0FqcF2W/+UG/Ff7GD8W5vNdoLnbokow=;
 b=eYks15xZkPGv+eqmr6+YsPtDnolhSynq283rraAaD2vjFiBiGERyiXat9QbG2oVPBRRTSJ
 xeb1o46G1H0EsfJrkIIiRIxV4heryWU/aOoxRWMCr5VRYcGggLH5wE0vt5R5ky4uttJOrE
 6ZnqqwKxw7jteHVA5XW1LsWXHWZsZow=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-SidViF4eMSm6czICUVfQgQ-1; Mon, 25 Sep 2023 21:49:18 -0400
X-MC-Unique: SidViF4eMSm6czICUVfQgQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31fd49d8f2aso6442653f8f.1
 for <nouveau@lists.freedesktop.org>; Mon, 25 Sep 2023 18:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695692957; x=1696297757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=77DcS0RLex3b0FqcF2W/+UG/Ff7GD8W5vNdoLnbokow=;
 b=T9wwyWDbIIK8YSlpCe+gziMlAMg8SyLoExSrZ2oD+6VrtgaZ6k10SyIiglFAEHts70
 gVxoVfUX0mKjp230eCOTPWetEUx3kQOb00vagGSO6Yu3eu4rOZrKIZ5spT2nCKKwz7PY
 W415QljlIk13hT8NGWrhs743ZXLLrU9IpC7Y0+2MsxAthjSLtl3wCpi9ynRTNmzQJJgY
 dX7p1wbaSFKQm46333Rh4YV2rNXsKZZl0D04jUUlQYf9inZHlrK0YhSBgPwxjjYm+G8d
 32ChSbkg7dt17yDmhZS1erz9SS4mQeMwvabPIX/VysiYPr3fTJ76x0FHpxL/4mSwHmsp
 zNCQ==
X-Gm-Message-State: AOJu0YykMt9BdZvJCkc0wduMN8g70n+ozqn3Gl7iUqShIXs0/f0llGWf
 P1OnMYGUmpQ3YGVySdgqAgAAWha/vvFl9iPDI7x7bksBAZrUWmtZaua7Q9v67/zHarY6VJEY1z5
 FWQ7ZOzS6haJEUtGRuOeZun+wiDAgafz1iLu+f3Pzx4D+OOf/pvGgEAFsOvvZ1GD+m772lvClqH
 sfb1tI
X-Received: by 2002:adf:f746:0:b0:320:6db:3548 with SMTP id
 z6-20020adff746000000b0032006db3548mr6476910wrp.55.1695692956998; 
 Mon, 25 Sep 2023 18:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXlakOE0lZUrP/5jkAm89s5JUyx/7ZmQVk052x7sut2qAHqqXQA0xx55aKZwz4vWl9jc92zw==
X-Received: by 2002:adf:f746:0:b0:320:6db:3548 with SMTP id
 z6-20020adff746000000b0032006db3548mr6476897wrp.55.1695692956564; 
 Mon, 25 Sep 2023 18:49:16 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 rp5-20020a170906d96500b0098e78ff1a87sm7052623ejb.120.2023.09.25.18.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 18:49:16 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 26 Sep 2023 03:49:03 +0200
Message-ID: <20230926014913.7721-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] MAINTAINERS: update nouveau maintainers
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Since I will continue to work on Nouveau consistently, also beyond my
former and still ongoing VM_BIND/EXEC work, add myself to the list of
Nouveau maintainers.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b19995690904..67ce91c8778a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6647,6 +6647,7 @@ F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Karol Herbst <kherbst@redhat.com>
 M:	Lyude Paul <lyude@redhat.com>
+M:	Danilo Krummrich <dakr@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 L:	nouveau@lists.freedesktop.org
 S:	Supported
-- 
2.41.0

