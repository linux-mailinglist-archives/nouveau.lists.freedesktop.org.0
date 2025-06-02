Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320B2ACAAC0
	for <lists+nouveau@lfdr.de>; Mon,  2 Jun 2025 10:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BC310E1BB;
	Mon,  2 Jun 2025 08:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Dtr0699H";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC7310E1BB
 for <nouveau@lists.freedesktop.org>; Mon,  2 Jun 2025 08:45:20 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-3a1f6c5f4f2so1491387f8f.2
 for <nouveau@lists.freedesktop.org>; Mon, 02 Jun 2025 01:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748853919; x=1749458719;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6VThKlttpzakaK+gyheH3wNtNAtAxPTgkZTge5fKamo=;
 b=Dtr0699HZDBmsapnstyirNFzv7FxVvlhLMMC+9oTaqdIYNj2p7F/eWbI1HIc1ekCnj
 TRmDRfmDhABffG+z81ZIRAE41ppRlZFADEI1T3NZGYI3SVbm51AZVFW1wdKL/YaJLow2
 0mJYidyDMx1GPuIRfZ9Ii8w0O8bZ3ZWHuaJLkN/o773OZFNX9GfGuihTE4aULRfA1vCg
 EG+E5bPWC7eCqJaekHfVAwL+bPIDo6AVHnzwBqkbaP77elix8Z5fr4CtKZEzyX15Tv3u
 yms4LD1LPMRUwL7800Ss86x053w1twiNKnCxRrGdaDEa6jJbvm2C0DpKLf+xUW2xqm4u
 GFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748853919; x=1749458719;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6VThKlttpzakaK+gyheH3wNtNAtAxPTgkZTge5fKamo=;
 b=TzViR/z/gtPQZFpQYM1hUs/Vka36rRbsN9VS1PWoxgT5kpJV+TnugVqLp+7m2Dj5SJ
 q/5gw5ti3ouRCXWyzzpb2vUeyp7+iKOqg2l47I0SWzuHNeXXnGZdV5/3ET1dTCxSF83U
 vpAOmNh6HGR3dmfWXx+QPTkyxcL7WB09ZDo5gZXfwzBekHwAd6/FcUn0lYmMdfTf2lyl
 v7jyRZHxv4GcHTmW/USCEHBxtQxgljA7Wnw3sAuFM8bEFSYWKmlMAj7NBaIQ0yQn9zCq
 P5DLNKccq9hx0MS0Crt6rZ3V/pzuAQ2cDFrKZ+tUB684A29IHWjnTw2xtS57irgAmHMv
 Svpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwllO3T24kg+yVSTrGF8kI9oLQtGczXoNsQPOHD6/HR81SCKyI0xpIy9eGheKIW0fVtRGPgdKw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2XCchW0d4aDzW3tKGHTYWR4YVMk12RdBisGfvnHOCVR+6QIGS
 ZNyaqa6kv2sDfyqekGdhxzfWVzIosXY2ZDIkJIhD+dD/nonHbnWGyk2U/UBRFUQHqmrilP8zyEq
 4L/SV+ooRxqUMXrSeRA==
X-Google-Smtp-Source: AGHT+IHMPBuyHnbsu1fzojxAvVWoB+t0RQajrCfQEAuCK7B7x+b6pusC9Fc1oNLvaFICxRkoCWW8Tzuvcbz6+Eo=
X-Received: from wmbdo10.prod.google.com
 ([2002:a05:600c:680a:b0:450:dcf2:1c36])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a8a:b0:3a4:dfc2:b9e1 with SMTP id
 ffacd0b85a97d-3a4f89a7e71mr9312736f8f.2.1748853918569; 
 Mon, 02 Jun 2025 01:45:18 -0700 (PDT)
Date: Mon, 2 Jun 2025 08:45:16 +0000
In-Reply-To: <20250530-cstr-core-v11-4-cd9c0cbcb902@gmail.com>
Mime-Version: 1.0
References: <20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com>
 <20250530-cstr-core-v11-4-cd9c0cbcb902@gmail.com>
Message-ID: <aD1knOuEFxv6VQy1@google.com>
Subject: Re: [PATCH v11 4/5] rust: replace `kernel::c_str!` with C-Strings
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>,
 Benno Lossin <lossin@kernel.org>, 
 "Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-block@vger.kernel.org
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

On Fri, May 30, 2025 at 08:27:45AM -0400, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible and rename
> `kernel::c_str!` to `str_to_cstr!` to clarify its intended use.
> 
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

> -/// Creates a new [`CStr`] from a string literal.
> +/// Creates a static C string wrapper at compile time.

A C string *wrapper*? What do you mean? I would drop the word "wrapper"
here.

> -/// The string literal should not contain any `NUL` bytes.
> +/// Rust supports C string literals since Rust 1.77, and they should be used instead of this macro
> +/// where possible. This macro exists to allow static *non-literal* C strings to be created at
> +/// compile time. This is most often used in other macros.
> +///
> +/// # Panics
> +///
> +/// This macro panics if the operand contains an interior `NUL` byte.
>  ///
>  /// # Examples
>  ///
>  /// ```
> -/// # use kernel::c_str;
> +/// # use kernel::str_to_cstr;
>  /// # use kernel::str::CStr;
> -/// const MY_CSTR: &CStr = c_str!("My awesome CStr!");
> +/// const MY_CSTR: &CStr = str_to_cstr!(concat!(file!(), ":", line!(), ": My CStr!"));
>  /// ```
>  #[macro_export]
> -macro_rules! c_str {
> +macro_rules! str_to_cstr {
> +    // NB: we could write `($str:lit) => compile_error!("use a C string literal instead");` here but
> +    // that would trigger when the literal is at the top of several macro expansions. That would be
> +    // too limiting to macro authors, so we rely on the name as a hint instead.
>      ($str:expr) => {{
>          const S: &str = concat!($str, "\0");
>          const C: &$crate::str::CStr = match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {

Alice
