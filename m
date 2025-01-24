Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0145FA1BBEE
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1800E10E9FA;
	Fri, 24 Jan 2025 18:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V5XYXxdT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A54010E9FA
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737742530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uNMLMXRsGIwKH3oEVvbcuQJLGughbp+wVpR10R9kOUk=;
 b=V5XYXxdTN/g8xO9nnBLki1bdDmZp/Ff25n5+5S2mkDJJAa0qarQJVN2Ef/i/JKBgSinyV8
 48g7Zdp5TjOJAiIKG6M8NSQutP9Pv3eGuR+2FHyY2F71K3myB/IuUf/Dx7tDG9csTISKyq
 iZxxPc2Pu0E1AyggfW5lgtQqypvwZjo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-XN2dXPD7MSK1KFYI__eplw-1; Fri, 24 Jan 2025 13:15:28 -0500
X-MC-Unique: XN2dXPD7MSK1KFYI__eplw-1
X-Mimecast-MFC-AGG-ID: XN2dXPD7MSK1KFYI__eplw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361eb83f46so19178565e9.3
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 10:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737742527; x=1738347327;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uNMLMXRsGIwKH3oEVvbcuQJLGughbp+wVpR10R9kOUk=;
 b=XbDzBKaMojz3XenR3WvHPi9O+jBMLomoGTUqW9LKv3cJ2uT+NYsyI+I4KKQQPLcnou
 xCuDS4okEo9l0L/0bIrW7znTowor1gRr8k59xbMjh7l22viZswU3JZS8dGrCHGFsOpuQ
 xKELpKVTXEu7q6kJzxj1jojDupBua571G/vPYPZ4PVjy8lOFLfIJ09QkmS2ApT7TFcEX
 asQCE58hqnxFx1iSawrXtZTmRwVXT4jfntuQG0ITasfKUuEs7EpAe654a90lY4Hkr1db
 DooYR51zM+ip/2Wv8FmqrfRsDSgufIlU5WQhFVK++YPt2Ln7kmHNNUQpq0eQFDV9WADm
 esxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMzgZYU8n2eQZ0SMCdVyPtGsUKfa00jm7N2r8JbB3iVu1UYvH1C6PEsLJJgjpj2L7rLOLSS3I2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV+W1jR4ePgCOrsx9FQRbg2BP9piCmhSpbtos3V1OEaaVzfesP
 jf9VROGMwX1aPQsa3ZKMpErcUqPnkYHSn1jL0kwU15zAl4W+SGHoYCyXMTcf/Jajmun3XmQDiRE
 5KEhj20CLNDOFmHSe623Ms28+pYj9xbfw99rvTgRKPavzDJ0uOCYnUaI2z7923p4=
X-Gm-Gg: ASbGncsKw3b5Axsmuw9fl5PZUSsCeu2MjHhtDbRjCgEz7o/gAPWEN/87E5+yXWk+rNm
 fQsNiE8gzMcLHBwEbjA7VaqELIhK9skja+ulCLi9KI9UPggw+C3r162BEFWsPpteWWnf+O55I1W
 DNjxe+EjXrKWL0IOsdmeb3xuVbbGfIRP/gGg6Igwt8vhhu6wu0t5zlzemglmTPCU6N9W3C1Zjft
 XjWJ82CktZXCEDnCULVdKgawKwmLu1eY2XyTx8JmVEx1+otkDOx/3m+4YdRuIoCMwTrciFRAtyN
 hR5ztrLqs8kfydyvgz8=
X-Received: by 2002:a05:600c:83ce:b0:436:ed33:1535 with SMTP id
 5b1f17b1804b1-438913e0384mr311105115e9.12.1737742527595; 
 Fri, 24 Jan 2025 10:15:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8s5w2r5GnraTv+tLMkaOyIRUe0oMPHR+MHeLBSQhRCsweLhtKjIKgoOzmPKljbLSnElWINw==
X-Received: by 2002:a05:600c:83ce:b0:436:ed33:1535 with SMTP id
 5b1f17b1804b1-438913e0384mr311104875e9.12.1737742527262; 
 Fri, 24 Jan 2025 10:15:27 -0800 (PST)
Received: from localhost (p4ff2332e.dip0.t-ipconnect.de. [79.242.51.46])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1bad16sm3434838f8f.68.2025.01.24.10.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 10:15:26 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v1 0/2] nouveau/svm: fix + cleanup for
 nouveau_atomic_range_fault()
Date: Fri, 24 Jan 2025 19:15:22 +0100
Message-ID: <20250124181524.3584236-1-david@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MF5aqXWYamhYpopX1SLnkhIeA3AkvjrNCXi0qmrsy_k_1737742528
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

One fix and a minor cleanup.

Only compile-tested due to lack of HW, so I'd be happy if someone with
access to HW could test. But not sure how easy this is to trigger. Likely
some concurrent MADV_DONTNEED on the PTE we just converted might be able
to trigger it.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Alistair Popple <apopple@nvidia.com>

David Hildenbrand (2):
  nouveau/svm: fix missing folio unlock + put after
    make_device_exclusive_range()
  nouveau/svm: don't initialize ret in nouveau_atomic_range_fault()

 drivers/gpu/drm/nouveau/nouveau_svm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.47.1

