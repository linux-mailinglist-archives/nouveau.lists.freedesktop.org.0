Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E86A1BBF2
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC8B10EA02;
	Fri, 24 Jan 2025 18:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DeuX3VKD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C467B10EA04
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737742536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bGWmGPJRu/Y2vFGNU2CYSMtLnSZ1JIf2dBRRTduba1I=;
 b=DeuX3VKD6X2CR9nhfcDu4515M6XPpf2Gn18s5hft2ddi6RADOO+IgmliF6sP8RS+TWZhKX
 0Q/wmZ0nubbLJNEiHi2R6Edrh08PX3O2vXQAf8r9XBSuaVVfyhE8DLfUyT+npemt+y4xPF
 2F6DvFUSNn/f6P8vdHJqFyXI23t1hf8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683--JdWMSooM2CGMsoleP6kpw-1; Fri, 24 Jan 2025 13:15:34 -0500
X-MC-Unique: -JdWMSooM2CGMsoleP6kpw-1
X-Mimecast-MFC-AGG-ID: -JdWMSooM2CGMsoleP6kpw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4362552ce62so11491475e9.0
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 10:15:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737742533; x=1738347333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bGWmGPJRu/Y2vFGNU2CYSMtLnSZ1JIf2dBRRTduba1I=;
 b=hqX410vKc88g6U7qcOLPHXjCpz2I8kZ57z+RMHzGK/bU3+yNAWceCaqI3Lbdtzj51G
 pqYINdS7OabQH38cWaTfU9cAz13O+DH8w9CfhRuLcgLvz/QELAYv3vC+W9qKMiiaVXuJ
 qY3dC1MEqGVCRhlRQEwXyZ/G/IUS3YBDXU/DGtOJ9OeoQgbUGB9X5/mVP+z8XkLVq/d0
 Uc+/NGj7t7dng5VAnB2eVj58eJmrNNMN5/A46YjnCg+aMeAH744xfZAc2jD9Y7uYulk4
 ma49mt9743SNUR4L3h5J9ev3ZNxnz5rxBwr2gH9GHbrv8Dhw2KOHH3+A5wfqy9jt0vxZ
 xCIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfFuwljsPfsbo51jbYaZPfNvZYPdY54AQo72JmGtOfsWnGWHA6wdW/t5KagvNkRQ88nmUcWOlV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9nmbWM1i84BOX8+c/6V0LoEhEh6hilyRg5g57vX/eLZHAfTsp
 6NeSppkW/4Rr4FihST9l8aDzCyF7ISEDLpOeq9D8L9TqDPSZLh4xrrq/T5z5APScDWYtwZuGHPm
 nnyva6dX4QXMfCcH+h5ssLFtGBQB9aDK7rQLHT9+AedOlq/NHM0onYXXHreS6JC2NGxiWTz2UKA
 ==
X-Gm-Gg: ASbGnct/GHdRsd9gxC3ansIIM7UOi6lG36NhygtSs+8l03NxQssSXlUz1WBtfj4yDgT
 hp5AOhVoRyqu8+fXLzC6ztzqb09bUD+rKXnYyZKTp57O4tGAIW7ApRgULWgLgNoUEWlCDP7tzM/
 Lm5SVQcouJPK63XiZ1oxMM2iaR8dWPCxOhCThCs4TDELkFp1r2IzhG8atVeNMLSQJFOgI4KsYij
 x/Q2DiUx+5nusAx5p5PdDtP9vyfZUP98+aJixWPlG98RDX4sVokqodhAqrYwu+5lAE5nsUyLcol
 irzpVz8y9WBrKGfCqRs=
X-Received: by 2002:a05:600c:1c93:b0:434:fbda:1f36 with SMTP id
 5b1f17b1804b1-438914299bdmr277981805e9.20.1737742533459; 
 Fri, 24 Jan 2025 10:15:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEji4W7ofEq55B5EikqJKy4d9Ug9AcG71r3tdNdvx7LPEmUH0Fw6EvB8CqjN3UgoYb9Od7iww==
X-Received: by 2002:a05:600c:1c93:b0:434:fbda:1f36 with SMTP id
 5b1f17b1804b1-438914299bdmr277981605e9.20.1737742533104; 
 Fri, 24 Jan 2025 10:15:33 -0800 (PST)
Received: from localhost (p4ff2332e.dip0.t-ipconnect.de. [79.242.51.46])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438bd5023acsm35577375e9.16.2025.01.24.10.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 10:15:31 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v1 2/2] nouveau/svm: don't initialize ret in
 nouveau_atomic_range_fault()
Date: Fri, 24 Jan 2025 19:15:24 +0100
Message-ID: <20250124181524.3584236-3-david@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124181524.3584236-1-david@redhat.com>
References: <20250124181524.3584236-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d2X1vFHO9zLxlSQnPQrL4nyHnojiXagsnw4UWy5iQv8_1737742533
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

ret will be modified immediately afterwards.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 8ea98f06d39af..2f8b8b978fc08 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -594,7 +594,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
 	struct page *page;
 	unsigned long start = args->p.addr;
 	unsigned long notifier_seq;
-	int ret = 0;
+	int ret;
 
 	ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
 					args->p.addr, args->p.size,
-- 
2.47.1

