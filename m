Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F35C8CA139
	for <lists+nouveau@lfdr.de>; Mon, 20 May 2024 19:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01F910E697;
	Mon, 20 May 2024 17:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gPv6sbGa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618C810E697
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2024 17:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716225693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ieml4cQgLdOB6f1Tq+rgmDncA9spVWDVEosV1A4OpmA=;
 b=gPv6sbGaFREhiljNh3to3Y8xK/K1v8yLPxnyqhEXAAWscK3l4ffAxfYhFgALNEaeaxZNcZ
 KJsP6vi3jqZmQqviDrvOIT1DMA1lRfqMojcEMc2Bg9aBjrJSw+O69L9o6/kgaw6/IdRMG/
 qDhYwD9ezCNUOG6C2PxFN02tuT9+sA8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-2mSfqtEzOEG7YVUDxLrpHw-1; Mon, 20 May 2024 13:21:31 -0400
X-MC-Unique: 2mSfqtEzOEG7YVUDxLrpHw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2e41bd70238so107412321fa.1
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2024 10:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716225690; x=1716830490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ieml4cQgLdOB6f1Tq+rgmDncA9spVWDVEosV1A4OpmA=;
 b=XeEZNdHFjLIkIe4UfyMP2+nCi7TCKWjD1B5sGgIqqWXBEDA20IKZxrmrQkST3cJkLX
 3YsRzV9dG2P0OMV/fUR2fHY/p1HiNuHTDk6MKbZvK8o9vZghuuQuBrmXku4aYw+Kq1SH
 Cko0CNv+U0w+EPoE5u01CrCTayMOy9yoEMQ7j2t4jiNh7gTT1o1fxsjuLqOAO5j1qmrL
 G7pYes7naCFRl+zYIPM3oerxpG/kn+BBCDtvGO72YyNKb9ycljLUf9147O7jT/bLsW3U
 OaBvj+Yu7bvt3pCzv/wQqWw9g4fMHuZ7/pasp3PrLKk2op0fX5W3inEKpMTKnIR9AUOm
 SQlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ZbwVAipN/NxaaSyfRcENw51YD9inT7ptyT/14AVLSMHCtFG8JORFcDP2RL2n1zRvnNp+Lfxt7s78wY76AYl038OPEeg8e1n4ZVkc+A==
X-Gm-Message-State: AOJu0YxhqxrKKgulXQQL8GrLItnwH3BpFnkbC1SVuPA0oRxmmHSJAchK
 MUrlUHJsoM9oBT0/SdjT+a+85xfzxs25DzUHxTdfn055BanEOQHrBY7/b8i0qiO5A1qWrW3Ndxr
 5SXvlXtdCI0zhC8Jy6Dx3oALDF3RWXYntHH/BCjoQeeAvh8QMHLyx5ICuNp0gACI=
X-Received: by 2002:a2e:d09:0:b0:2e5:2eaf:b095 with SMTP id
 38308e7fff4ca-2e52eafb1f7mr191077701fa.39.1716225690427; 
 Mon, 20 May 2024 10:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7q/RlyHXDaQZTvhlrA4Lq5+xbLf2b2bh7WpMR1SX2pe4dg+hi0hk9TL8lOhimdQzmJb/j0w==
X-Received: by 2002:a2e:d09:0:b0:2e5:2eaf:b095 with SMTP id
 38308e7fff4ca-2e52eafb1f7mr191077521fa.39.1716225690105; 
 Mon, 20 May 2024 10:21:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42013bf1a5dsm326293055e9.30.2024.05.20.10.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:21:27 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 4/8] rust: drm: implement `AsRef` for DRM device
Date: Mon, 20 May 2024 19:20:51 +0200
Message-ID: <20240520172059.181256-5-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Implement `AsRef<device::Device>` for `drm::device::Device` such that
`dev_*` print macros can be used conveniently.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/drm/device.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index f72bab8dd42d..aef947893dab 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -79,6 +79,14 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
+impl<T: drm::drv::Driver> AsRef<device::Device> for Device<T> {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
+        // which is guaranteed by the type invariant.
+        unsafe { device::Device::as_ref((*self.as_raw()).dev) }
+    }
+}
+
 // SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
 unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
 
-- 
2.45.1

