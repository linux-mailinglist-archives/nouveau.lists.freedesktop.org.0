Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD230BCB367
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 01:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B24B10EB36;
	Thu,  9 Oct 2025 23:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E3P1K2xx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686C210EB38
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 23:39:50 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e6c8bc46eso8792085e9.3
 for <nouveau@lists.freedesktop.org>; Thu, 09 Oct 2025 16:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760053189; x=1760657989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OpLyNX9fRh+6ZSUeqgLPaV8NCrY8WnY93VlPM/N7oK8=;
 b=E3P1K2xxVKxge7hfM1OTpH3Hqujk8lpdSs5Nbrw+jaUDJAhrzWxkFLTNYoCPymMbsV
 zhjkIbbIOJervDveVR+lFq6t57D//xxYY45n2PEto1fzko1EKXTuEkLjurMli6yINKYp
 FF4arZqLoxsqTZaCI9mhYHti1gcvo+F3aXq2tueRg3X7tA8JQmGjVgfntNyVRzMtO6P/
 0NCraWuOAf2KQku8WAcBfSglw1nc7zuEiFEE/DnnVlOzW+it7L+PQPpdfswdvECF+HZP
 nfHqlBVMZltu+vIv9lpvRaTpM94rZAOITspVIxis1XxGc6tbKRrj5y8iTmd6s+56GA9v
 DvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760053189; x=1760657989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OpLyNX9fRh+6ZSUeqgLPaV8NCrY8WnY93VlPM/N7oK8=;
 b=rDZzE3JQRiV59E87CAi/wkP+MGQQi4u3w5xtFjXsiV6KjH47xwU/W3JCz3XgQ1i0+j
 ibOzX47ktov5vi9f3tu6RhZa3GW07V+ZdpSejVfJR3YQd07vVl49IOPLnyHbcSLtF3HQ
 UNfBYYz1TkcKghMCvKOa5z7CdpZmAiqBSE1Y+7bteWNcfqdndH7b+9hEEsi4n4r7gesr
 0Uz+OHqKQfwz87lsgKB9wdJjH17fbQC2+lhg557oMOmLHGl+R8gxhP+RngSyvy7o8geG
 /UfCgmNdW0e2eZG6N66khzlJs+HNfVJfXyHk84H3GDZ7TwyotIHERpAEWxDew84Qnu6w
 +ObQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqSItsz0T2Bw/IjEwuk9ryt6NsLrNwKkbJOE4Dcnc+ZcagfaDv6pm/lUBoA1ykpqbukTp/usfm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS9DFZ4HIqV2BsOiCNbVOddRidEjuiCYMVxVozVarM4d5CLhFR
 QCYjrRbxNmMEkhWKSLcFTR8SfD7Foi7opeBdPFuz5P+QCwC9jADIKOli2enVew==
X-Gm-Gg: ASbGncs5r8lXy+Lv8cX2jNRTB9/FoxEK1HBhq7xNh2SiQcJWyNt6QJIHcDln0cp9FtY
 Gi95ue+AE8DBo+3SLiZAzjkHbPhEVEiVQCQatY7iW/ab/Zyqj/FLFvzJld6j6RxF81UrmoaR6zh
 DQbYTetJPBSl9v309mfG6US5jfdN0RBgQq1EgfPec+Am0nC6uI8OSrgGi/pUYy2mfmwhZH0QvLP
 bHnMjW/Ukeh5uYUoZMbLZaFf14NaAEPwtxeXB8s8ue3dq3Za0GYzU7SU98/72Glk8nriyi1j5D2
 dpR7fOj25AklgXP5PYEiaU3Cu54AYbZ8Q0ePZICPD3OHJyAcHdiAf2EWvdg4KhjKi5sfxhtbsW6
 t6s0STsrHQjnAYqtyw40DxjpF5d5jxDNsIwZTeJ+AophrCUaftgrr
X-Google-Smtp-Source: AGHT+IGJYw11rDLltJwLvCnQW4izSML6BKxvrZuXRvJXZRf+jWWFVqJr/ShHNVK1a4VjhZ4lvPbVMg==
X-Received: by 2002:a05:600c:1395:b0:46e:27fb:17f0 with SMTP id
 5b1f17b1804b1-46fa9aa204cmr65438775e9.9.1760053188697; 
 Thu, 09 Oct 2025 16:39:48 -0700 (PDT)
Received: from fedora ([41.45.27.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3e3206sm46066075e9.4.2025.10.09.16.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 16:39:48 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH 5/5] drm/nouveau/drm: Bump the driver version to 1.4.1 to
 report new features
Date: Fri, 10 Oct 2025 02:38:37 +0300
Message-ID: <20251009233837.10283-6-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
References: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The HW can only do compression on large and huge pages, and enabling it on
4K pages leads to a MMU fault. Compression also needs kernel support for
handling the compressed kinds and managing the compression tags.

This increments the nouveau version number which allows NVK to enable it
only when the kernel actually supports both features and avoid breaking
the system if a newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 55abc510067b..e5de4367e2cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,7 +10,7 @@
 
 #define DRIVER_MAJOR		1
 #define DRIVER_MINOR		4
-#define DRIVER_PATCHLEVEL	0
+#define DRIVER_PATCHLEVEL	1
 
 /*
  * 1.1.1:
@@ -35,6 +35,8 @@
  *        programs that get directly linked with NVKM.
  * 1.3.1:
  *      - implemented limited ABI16/NVIF interop
+ * 1.4.1:
+ *      - add variable page sizes and compression for Turing+
  */
 
 #include <linux/notifier.h>
-- 
2.51.0

