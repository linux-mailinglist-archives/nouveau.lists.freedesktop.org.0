Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0BEC84F48
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 13:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C2D10E3B4;
	Tue, 25 Nov 2025 12:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="H+yFPGgv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D6810E3B0
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 12:24:44 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-429ca3e7245so2645321f8f.3
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 04:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764073482; x=1764678282;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UWqCGf4yniNYnv+0gGu8q0Azun9cQVkGzauYt4WzdGE=;
 b=H+yFPGgvH/L+sjMg1anS+DuT0uB+LHpbbmhxO3NrdnMwQOozthuptV6niVfkgI+NOM
 jAkcnHz1kP3A5zQkqFPgBCZcpijWTvlI5AhlE/5tOArHTjKm/aPdeuPEMIjRcmwA57Sj
 A+XXDF5iSERN1RJqRqAYuHOzw2GyriwFaRTKZeOK9GMgs0IoGwk2MhRHs3sz7jQFJlvs
 DvG97MIkCMfcOoRWcsSEt7psNBFzyv0i4gzvZthJQ2p9bTkbZ2YcOFKMfU2onrjRqsdX
 UphAXdVi6bxl+EzEsLmY8Gkqjp1LOiqWWCslfYrxRUH2vTV8ubT2yT10dzxHC5kQ40UT
 Q68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764073482; x=1764678282;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UWqCGf4yniNYnv+0gGu8q0Azun9cQVkGzauYt4WzdGE=;
 b=eY3q7DeL1JyH7k0E129Wa+o/pE1H1P57emr906hAbWpAEV7HCxgGCt817n6ZZLZgox
 6jt8DzdtXOfL/F4LJPw3iNZExOFIL35TAaKQsUFFbM2MxqQF7KkcpIxwoTpeIfJc9Cfn
 w31Yc0qhnI1wwV9SEZ7CrfBYedQElsj5Lll/c5mASkWTMMcOWQrTC85wfjxP3QKSG6UH
 AtyHJxq4XRenYbzyzVwmrITf5n939D0s8ITsZ1buB/F8bCCVM9i3Plhn7U0tQ1PdqwgY
 nypzsOyhRDmX0aIgPUd4AmkJ1xkVssc5T3Ue76OHVnOjKxCoeEV+aB+wZBaTpRIW6byJ
 5NWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCKIyTCAzNSIip7f6768t+cr8wnc/sXn4X3PMfzZ87REQYcQeUhsa2j7IGYn1iPsl/Qhl4yTTU@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2UHvu/qbKGeVmcSV9yciAFstdvTj4KhKwrbAEYBtc9ZisYz1y
 qvsE/jwe8R4qSXbTbBNkv0s0FakYq9y9nTdufJNiDs4ibhMlUdtJkr9n8UOJC5HncBWBczJNluJ
 nIZS4sNg7SOsKkL8JNA==
X-Google-Smtp-Source: AGHT+IG2G97KKRtl5QTLxOePIordMgMh99WR16j540538wZ8wcvVCkUBTwb1GuKCnER5wu5hmB/vT2jtUiJeEds=
X-Received: from wrrt17.prod.google.com ([2002:a5d:42d1:0:b0:42b:29df:cc2c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d02:0:b0:42b:3339:c7ff with SMTP id
 ffacd0b85a97d-42cc1d19a16mr16939785f8f.43.1764073482439; 
 Tue, 25 Nov 2025 04:24:42 -0800 (PST)
Date: Tue, 25 Nov 2025 12:24:41 +0000
In-Reply-To: <20251123092438.182251-2-shankari.ak0208@gmail.com>
Mime-Version: 1.0
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-2-shankari.ak0208@gmail.com>
Message-ID: <aSWgCT0beyqaD4jE@google.com>
Subject: Re: [PATCH 01/10] drivers: android: binder: Update ARef imports from
 sync::aref
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shankari Anand <shankari.ak0208@gmail.com>, 
 "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Sun, Nov 23, 2025 at 02:54:29PM +0530, Shankari Anand wrote:
> Update call sites in binder files to import `ARef`
> from `sync::aref` instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Greg, please go ahead and pick up this one, thanks!

Acked-by: Alice Ryhl <aliceryhl@google.com>

