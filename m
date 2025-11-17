Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB0CC64B80
	for <lists+nouveau@lfdr.de>; Mon, 17 Nov 2025 15:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D4910E39A;
	Mon, 17 Nov 2025 14:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="iiaz8jLL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE36710E39A
 for <nouveau@lists.freedesktop.org>; Mon, 17 Nov 2025 14:52:43 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-42b5556d80bso3382318f8f.2
 for <nouveau@lists.freedesktop.org>; Mon, 17 Nov 2025 06:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1763391162; x=1763995962;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=DEmDel8YP6SryUyQdLqbBEwquCJ086XrGsRpVZIAPJE=;
 b=iiaz8jLLKvKhBGwAoOeGcn9yK+4vEP7Rtqap2F8PagTNYYB/NRZBjWTO0nY9S4zXem
 btFeaaacvFHiqx86Q33DQs9GrvWp+gvz4s7boo0V1Bylv/gs+CozQAYgms4nN45xohvp
 9QtOgSV5r665Gx/iaF0GtryaVjWJEstjqaHuFOIO5Mlk8zSrKxUJMZBtCPHgnUn/YcIW
 BNMEzLzSMarEcB7FzkmETgTWo3Bhp2e3tbphI94XBHP+njEygyEZUYtPnbI94lFXaL31
 xij1nm+l8WwJ5VP/oR+9n6Emyf5Bzaz8tiYcTEOTnjO4ZvSikhFSb+3zfvfUDPR/iSTv
 qYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763391162; x=1763995962;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DEmDel8YP6SryUyQdLqbBEwquCJ086XrGsRpVZIAPJE=;
 b=CcpwFWssSkuQwsvDJRevvBAQ9MItuZTelYpc+FnB7nPElObKe0GdcrepaJosHCGbwZ
 Bo3JFKr6O+nHabJLT9Bq1KHqnLDhT5zydy/xvNd/ZjUDuERC6r0LVZxGLozM1a4BtqsO
 slT7AUICjcNA5xAGlYErztD5BxC2dPznQalyJsvV3OCBuJeXbh2wxLPrftwXJ6qTRMbE
 YZAx50g+AYGIxqkPcPeDxLbyyajiugJNie6xJVO6708GTfLtKAGzkWPwf6xfgY8MFbF/
 CUrGbxkesjl3G3KFuk1dmEJX+zHJUWVyQ+EZrTtIl907c9YNG0H1KBnVNFncFmPsnMtC
 zi+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdr2jYbjhSQ82rvMFVWB/UV/ztr0m/U5uiyGEGYh4DYRwV3XrwHUWwWKlkL2UE8aE8uQS7dxz6@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3JfD9F+H+DYchttzU/TsuwONb+7Q2a1HWWVSmnA4NDmlTzfhH
 EbWzZyWYnqOBAqXA4t5p8DCxyQx6gE6R8j4OYVUQJ7tTkL/I9pMod8LVo/YpPBfBd/qLxSfquE5
 gNhWsCoxQ7VYLQ/yEYQ==
X-Google-Smtp-Source: AGHT+IEbGuGz0lgPXN/Q0+yKdln87Gc43i0ZEfM77W4barCcu736JcYss1j5wxMyvW59kDu9IU8AnICCu1X5VAI=
X-Received: from wrrm11.prod.google.com ([2002:adf:fa0b:0:b0:429:c2f9:8017])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2585:b0:426:ee08:8ea9 with SMTP id
 ffacd0b85a97d-42b593901d2mr12477971f8f.44.1763391162404; 
 Mon, 17 Nov 2025 06:52:42 -0800 (PST)
Date: Mon, 17 Nov 2025 14:52:41 +0000
In-Reply-To: <20251117-nova-fmt-rust-v1-1-651ca28cd98f@google.com>
Mime-Version: 1.0
References: <20251117-nova-fmt-rust-v1-1-651ca28cd98f@google.com>
Message-ID: <aRs2uTHwnTm9fdKs@google.com>
Subject: Re: [PATCH] gpu: nova-core: make formatting compatible with rust tree
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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

On Mon, Nov 17, 2025 at 11:30:07AM +0000, Alice Ryhl wrote:
> Commit 38b7cc448a5b ("gpu: nova-core: implement Display for Spec") in
> drm-rust-next introduced some usage of the Display trait, but the
> Display trait is being modified in the rust tree this cycle. Thus, to
> avoid conflicts with the Rust tree, tweak how the formatting machinery
> is used in a way where it works both with and without the changes in the
> Rust tree.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to drm-rust-next.
