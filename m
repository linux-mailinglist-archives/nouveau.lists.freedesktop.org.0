Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EC1B3B61D
	for <lists+nouveau@lfdr.de>; Fri, 29 Aug 2025 10:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A8B10E3D3;
	Fri, 29 Aug 2025 08:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DaoCatQx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1148F10E3D3
 for <nouveau@lists.freedesktop.org>; Fri, 29 Aug 2025 08:38:40 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-45b7d84d8a0so3300525e9.1
 for <nouveau@lists.freedesktop.org>; Fri, 29 Aug 2025 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756456718; x=1757061518;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/jjWn/JLKRwrg9AnRIkp554v48bzaMLTS/B7CQiq9I0=;
 b=DaoCatQx3WLRnG+qrvdOxsZLk4z0ofhCxArmwkWZaMXA4Mqki8so+X6cXIU42AYWLD
 88Lm3/HMO+m0iu6ZXgeLEbNGGGO6UReqBKc4e7Rl/ZLoVKJRCAn3wEVJau6ZENGAEj3D
 jqWBChoP1noNYZy3OzWZFe1G9pE9Dv+cANfJoSo0Y4GCnvjckyLLQk6xpNM+J+6qINlM
 9EpXpjQem8Dh3vyRIbjhKk026F2DJvtdG/UcTVa3Wk1fVRiLn5YP2ZyNWKDMDmQ1CkPj
 +ZZ04WiDLKdb5ey5M2znAYQqFZ+gwcklyb50tzmiduyRvnqk6HjykjddozQJJw3WBJDw
 VioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756456718; x=1757061518;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/jjWn/JLKRwrg9AnRIkp554v48bzaMLTS/B7CQiq9I0=;
 b=JorZOzOtzSENm7e7cuVc4Wxhw7BiwtPujOAlAWNCSbWH3GhQJ01wLaynVJ2+tJEnJA
 UTn58be2EOyqKSlaGUcYAz8OiOV059D0+wwtdrFIULtSkUN/hQoWkQHBaT1JjU28EFcy
 GXnaVYaWK6NIfqY/YEB2tFeydRhNqamzshZTSa3I2KfRTc26JPAXq06MjwdKRas42v04
 wjQnbMai3HqCKfNGJXempZFHB2QWAtH9+YEe8ecQmwiKZK4DoAausxM50UG9iP1RPZuO
 HrzImfzUlhe3bysgAn+y2ZJ3pkRhChsD9xZk+v5lPqjjUfyXU/v68tsY/VrjtgoEwxlW
 aofg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrsGjqP64CSKAPwi/hP0J8AUP630lsMx6JpCwmFAAlpO2QXescJ7HYNifj8ObhMe4gOip+J3gK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAWFaqXrYRCzvY78FMwHWXnTJKT1tLnkmW6L6xUckH2Wpbp1qa
 a5MPk2oSWlluXpcircklQHIKiraN772wprWEUrV+f8jMTAXjPtNWzq0ku329XcqgsIctNyIgoHn
 iBH1Vp8gU3KXJuBr2Jw==
X-Google-Smtp-Source: AGHT+IGoiD70A1jH27tST4mNKlIuDTGR/gRna+ZZ4e5bwH4zAAv1pz4WMFOCfptcMxWHYNR80vnn5uw6FjfitXk=
X-Received: from wmbee21.prod.google.com
 ([2002:a05:600c:6415:b0:459:d6d6:554d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:444c:b0:45b:804a:a65e with SMTP id
 5b1f17b1804b1-45b804aa8a6mr10568295e9.28.1756456718610; 
 Fri, 29 Aug 2025 01:38:38 -0700 (PDT)
Date: Fri, 29 Aug 2025 08:38:37 +0000
In-Reply-To: <cover.1755235180.git.y.j3ms.n@gmail.com>
Mime-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
Message-ID: <aLFnDWwNh1MgBBGw@google.com>
Subject: Re: [PATCH v2 0/5] rust: add `TryFrom` and `Into` derive macros
From: Alice Ryhl <aliceryhl@google.com>
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Fri, Aug 15, 2025 at 05:32:10AM +0000, Jesung Yang wrote:
> This patch series introduces derive macros for `TryFrom` and `Into`
> traits.
> 
> A few enhancements were made to the custom `quote!()` macro to write
> the derive macro. These include support for additional punctuation
> tokens and a fix for an unused variable warning when quoting simple
> forms. Detailed information about these enhancements is provided in the
> relevant patches.
> 
> This series builds on the previous work [1], where the `FromPrimitive`
> trait was considered too heavy for the current use cases. In response
> to the emerging need for functionality similar to `ToPrimitive`, this
> series also implements the `Into` derive macro.
> 
> The original discussion can be found on Zulip [2].
> 
> [1] https://lore.kernel.org/rust-for-linux/cover.1750689857.git.y.j3ms.n@gmail.com/
> [2] https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/near/524335626

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
