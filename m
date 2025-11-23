Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02077CBAE39
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB5D10EBF5;
	Sat, 13 Dec 2025 12:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmmKXNog";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D4210E126
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 09:27:32 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-298145fe27eso54064965ad.1
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 01:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763890052; x=1764494852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNN0MI0LidT4OFHOALkJ5vSdl55jONLNA9sdMaqYtkE=;
 b=SmmKXNogTgWL7/+QckBoeTrsid66XjyA36t4RZjflJr6rwef6velMcD5tarkyqrobi
 1Z0B8ihffdStbDGukcdWO2DwDyTYJg9BKklViuKiNoE3jtdqMElUUiDjDGj1WSxwbvGg
 VLzFco9BHq93DknCAUeZp+KhXPaVZZlW+eiqt5wd7d0D0+P8zH5Xu/dhyiKAHgBLyuXU
 gG3bSlB6B3dXi+Uc5Cj1HLYNkpG1E9VwW8FO1t6duYR6IBEyPg9cWLYFeH6MN/2X/C+y
 2RaXnTLSPj3bXNw9DqbN7WFcR+aVRqt6vlfWXIKKRtWvAU7QuhTGot1H858w2simEmVP
 dQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763890052; x=1764494852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kNN0MI0LidT4OFHOALkJ5vSdl55jONLNA9sdMaqYtkE=;
 b=HjGkCHY0kORn9j+cxzxyiyjwEyEcVllR20gA6FgVEeBYZl+0eq5kp/HNwgQbIUgCmO
 /Xjk/YtTw4M2AJE7DkOkOockOnHs4oW8vNYHo5wRURvhSeBsbywXMqBWuIAcFGTClVLm
 WejvhNSDYpgY7pXMNUWx6iNkZ1iOfBqpnOb722FUgBZHZMiJwg+dciLJDCWpRIBvIEjL
 /4zF0Ts/+vynSghSJNfq0H2dISr0xrnxtpPpMPs4ZoFrtEG/Av/MTNl6V0gWF4/d9MNJ
 uyUM64RTr8vP7GjLurICpcdD2v9AsChi2AdPkq8CDETi7OouEDOBeSffW/vonARtQ4WN
 UmMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJcWvDta3vLW84Jn4Wy9oc+dEIpgUBAu3HTZsPqlyhp48ht7x71eTWqaN/HWZWpxHJ4GUzHsKZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmF/J5GkmCfKXfDlv94kEBA18rPXqqISi76AKvWp4imXq4cvP/
 t9mapKFtk/XhA+WnxFtFLFBLblLyHfejGYip+4R9Co2MM6wurCrgkrNx
X-Gm-Gg: ASbGncshbpCrGyxDtpz2xnlt49OhM49nRUgKa9esy6L3Jyx4WSjjFmlf1vIRFHEZs+f
 wYc3DaaXU1wlgadq6CbyXwnIkctS2xFjLZp1LYKs1GgcfTcraNmWTTJKkbH82zNhw4DlTsPAiwN
 5+4d3DcY1O0nGy8dgR8AMG//vDVvwsH6YHVDZ7ZIMhrv0sIEMac/6ezBSI6y07FqKEV+yKdwuRE
 uZgP+YPPDOrWHHKQrwHMN09/wNpfEv1ibY8BHgrO9U94LkT708MNd9STRwAZyAu1mFRMqUNEyTb
 D0FSa5kwINs7AALYyg4MJWz9sG1RMSYtP6SounP8dRzUps4y7VyiU7qTDXM5sjzVc9jJ3LXzBsG
 1n1D41ewpZn5NQyKvmmu+p6eq1R+/qbx6Xlfj7P7gvjI5kW+zQbmSv/HA9o4u+DDHBJ9r1W5WRS
 J6Dm/NSgx3VSFplnwAgYx9xtm17A==
X-Google-Smtp-Source: AGHT+IFee8cb2TNSz47vMFblRZKC7Ldla9Ih927BxHiIgXSYRbtyZ2DKKrYa3dNyowUaxQz5HqlIJw==
X-Received: by 2002:a17:903:2f86:b0:295:7806:1d7b with SMTP id
 d9443c01a7336-29b6bf37e59mr102978025ad.45.1763890052139; 
 Sun, 23 Nov 2025 01:27:32 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:27:31 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 09/10] samples: rust: Update ARef imports to use sync::aref
Date: Sun, 23 Nov 2025 14:54:37 +0530
Message-Id: <20251123092438.182251-10-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
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

Update call sites in `rust_debugfs.rs` to import `ARef`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 samples/rust/rust_debugfs.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
index 025e8f9d12de..be245da577a1 100644
--- a/samples/rust/rust_debugfs.rs
+++ b/samples/rust/rust_debugfs.rs
@@ -39,7 +39,7 @@
 use kernel::sizes::*;
 use kernel::sync::atomic::{Atomic, Relaxed};
 use kernel::sync::Mutex;
-use kernel::{acpi, device::Core, of, platform, str::CString, types::ARef};
+use kernel::{acpi, device::Core, of, platform, str::CString, sync::aref::ARef};
 
 kernel::module_platform_driver! {
     type: RustDebugFs,
-- 
2.34.1

