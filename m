Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FF3A1BBF1
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E78210EA00;
	Fri, 24 Jan 2025 18:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WbDyzt9E";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A7D10E9FF
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737742533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sH2n76/tf6JZeoIK8d2JObbHEPa7c6/XDsbabI03lVU=;
 b=WbDyzt9EohfXYFzziP3xMMa1uUwAArx3kon33bh6m+6AcBn6WYqez97Rot/hRDLyIpci+p
 hA9yZB21yrvM3SA1CVsVQ7QKYtSkQNoAsJH/vzTDu8M1vKz8Pz3B6RCaZAdAG7syZFZQZ0
 FiwvUhjOuN5uL4F3RPNyQ9yTb7d+HLE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-OnHs_JsrM9eLbdzw-JybCQ-1; Fri, 24 Jan 2025 13:15:32 -0500
X-MC-Unique: OnHs_JsrM9eLbdzw-JybCQ-1
X-Mimecast-MFC-AGG-ID: OnHs_JsrM9eLbdzw-JybCQ
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361f371908so16496135e9.0
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 10:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737742531; x=1738347331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sH2n76/tf6JZeoIK8d2JObbHEPa7c6/XDsbabI03lVU=;
 b=cbhI8+R8eFlpxHt1tnx8GqHI3z90O5PsnjtD/18NVmhI/TadYsKpoLSM7iQlz7482Z
 uEgZQNo5OGdy7NjkDE/xKnPGyPX4lDezdz6b4rVtQ3PwwUv6kBVqSvkrDw1xvn3gEe0Z
 d6yWsSb/dYwZYYjzP3EYheDXvwrsZDudTa0v44e1euzA0CW/TlXrxA1iNmyk/9MdjxcN
 aHxQxeAx2l0/Y243zn/+VY4RVXsWpAr+niwBuv8FfNVX1kotmxTBFjo8a0JMYN644USg
 69XqpKPXyk5DdgbOFEQfHFFic6q4PXYXWLCZqTHHxTK0pSLGQnLCPLVDRaCn1YVRzDdM
 iqDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2AXmJk5jyLVEyIqVxi/e1rsYePH+IBZA4azmBydzIY9oh3iPNS2BbJ9u30eQ1hoWr+eRisjqn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYRcbGjjT5bw99GF5l+nr2S0tJbaEWPxXPYMkg0CY53Wc0XpRy
 5ekkHqj9itJKGvtSI/qFO9b+JEkcNElP26r135j0C7pvPVUnG6neK9YSjUvs3eOiF2GrklwMjgA
 m/Uy1APfCx36maOm3z2l5hfg9IiRo+jIjg/xI9iBfzF8mEEQK/74B/Zz+TZ+o9V4=
X-Gm-Gg: ASbGncsiFS2r0tPCMR1affegmn28yVan0mKA/ebA/3sOKoNmxVX6OyBon8RNQ4Ek5et
 ElfC4fspCvO35zumhTZ6EYX/EglBBS49XwzZV1lN1Ni436v24iHFeJe5T9g9XSjDpHsvW61ZMoN
 Ckron9cscSQ3NHhsJFdK0e1RuRIKgSuQl+o5nvNHvo5ovduMJ+27BZYj0J2GVYcHlFQncJ/MqLa
 zRg2/bPHBLZ7rbkXMD4vt9Lq1mGoTkOkgyeh2ektFIRjnfsgZORJWm4Ty6fOADzGTM+m+/a2lUS
 BqHQUk2iUxsgX0Hs/xw=
X-Received: by 2002:a05:6000:1863:b0:385:df4e:366f with SMTP id
 ffacd0b85a97d-38bf57a97c7mr38957979f8f.38.1737742530844; 
 Fri, 24 Jan 2025 10:15:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXfQxgBsiTmTBvy8dlTrww1P+DiJSU6LKwAirl4rMiJ8To7yEoRhGiZ5C7DyirkpNpMNuBwA==
X-Received: by 2002:a05:6000:1863:b0:385:df4e:366f with SMTP id
 ffacd0b85a97d-38bf57a97c7mr38957950f8f.38.1737742530494; 
 Fri, 24 Jan 2025 10:15:30 -0800 (PST)
Received: from localhost (p4ff2332e.dip0.t-ipconnect.de. [79.242.51.46])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1766d8sm3520477f8f.14.2025.01.24.10.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 10:15:29 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v1 1/2] nouveau/svm: fix missing folio unlock + put after
 make_device_exclusive_range()
Date: Fri, 24 Jan 2025 19:15:23 +0100
Message-ID: <20250124181524.3584236-2-david@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124181524.3584236-1-david@redhat.com>
References: <20250124181524.3584236-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pz3VLrHFgGo0-MOje4gYgDd667IhNlix6QQh2ExHxjE_1737742531
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

In case we have to retry the loop, we are missing to unlock+put the
folio. In that case, we will keep failing make_device_exclusive_range()
because we cannot grab the folio lock, and even return from the function
with the folio locked and referenced, effectively never succeeding the
make_device_exclusive_range().

While at it, convert the other unlock+put to use a folio as well.

This was found by code inspection.

Fixes: 8f187163eb89 ("nouveau/svm: implement atomic SVM access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index b4da82ddbb6b2..8ea98f06d39af 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -590,6 +590,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	struct mm_struct *mm = svmm->notifier.mm;
+	struct folio *folio;
 	struct page *page;
 	unsigned long start = args->p.addr;
 	unsigned long notifier_seq;
@@ -616,12 +617,16 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
 			ret = -EINVAL;
 			goto out;
 		}
+		folio = page_folio(page);
 
 		mutex_lock(&svmm->mutex);
 		if (!mmu_interval_read_retry(&notifier->notifier,
 					     notifier_seq))
 			break;
 		mutex_unlock(&svmm->mutex);
+
+		folio_unlock(folio);
+		folio_put(folio);
 	}
 
 	/* Map the page on the GPU. */
@@ -637,8 +642,8 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
 	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
 	mutex_unlock(&svmm->mutex);
 
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 
 out:
 	mmu_interval_notifier_remove(&notifier->notifier);
-- 
2.47.1

