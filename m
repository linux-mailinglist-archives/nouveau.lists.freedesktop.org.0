Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72892AEF560
	for <lists+nouveau@lfdr.de>; Tue,  1 Jul 2025 12:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB83C10E25A;
	Tue,  1 Jul 2025 10:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XeiAjQbu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B1810E25A
 for <nouveau@lists.freedesktop.org>; Tue,  1 Jul 2025 10:44:13 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-607c239c7f0so2926895a12.3
 for <nouveau@lists.freedesktop.org>; Tue, 01 Jul 2025 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1751366652; x=1751971452;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KkP3Q/mrHcTXpi5jFAQSRZZTttwkOM8RfBay5zssxDs=;
 b=XeiAjQbuYXnx/6zbwA19Wsqje1RPeXhfS+hykKSxL2Hb33Sa+WAWlE5jRJd+83VAYa
 NHDyWD7CA+KuVqI3jbvA9H/r+OPbSpTTOsxTsO4zZo/qRLVqfQc2/NPrZGAJ+U/vO1Vv
 /J9WLJSOLn82PVAqeSPprPKLwOONnnIoSg7d6JvQfyjCoK5eqzxBjcvqqQV2K5atoPBC
 wZWAJ2M6aZuitzOO/GVwC9q/04zHInDkdXN7n6VoNA+1Udtsq7TjQVkxU/k+/GhPfwHH
 NeOtI19qR3mSoobIlgeZtJoAwuUq5vjHPLna7jkw+nqa9CCLf6PaDNgoK4NNdb7SuP6l
 sZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751366652; x=1751971452;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KkP3Q/mrHcTXpi5jFAQSRZZTttwkOM8RfBay5zssxDs=;
 b=vN4U5rQd8OiTkLm7e6x9YE7Ebe8U+wq5aesmRFzMVlL6Af2L74C85jH8UgxjFgMUvj
 5PrPkaHDvHcfGpzduqL5Ysu5PKkiYqbuy1a/OQBhxF1zblZ9AaWGNNXTFqn7IN/4aCEW
 Rbartt5UM/19TuZRkCOoCE0HgiOGRt96xh7FdWiPSqRm9Czjgeao+PliAzaHvA07alHK
 z0ENIUGkhfGnpHd/0NSxwSV3NS79jmkld1s+zt4z1SgY7crCRkEEj470+DJuiUb6grdZ
 GvplJdOZCwRWTdm5JAmJVX9qdn2b6+NjiHTjjKLMCsZvmGrFszyzGVXy5Fe3zBkmHkAw
 RGUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzqhWVML3MOc8jw1jSn6YOcHJ/TwZeIsbbyuoJsPUJkEBqOKZYTSo7zLtBDPHGc0Gx0n9+5M/3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW2p3mBB+RG1gkP6Ek0kmkx0eHYN3Cc1EiDr3dXM18bkb7ZgJM
 X/PZp5nQ1nv0YSbWGHAHzc3EU34pNNfxiPLpzwqvNMOg4kj/pk5D9c1nRY0YwyfyhhOq31AoUnS
 FELcysEPUodlNZkZM4A==
X-Google-Smtp-Source: AGHT+IFVVYwcwXIW2+rs+LXCKTLno19A5yuxBI/UefmvL0JcGML1UYLUePmSmcmNLPYFZsBsDSZ4dtmzcyM66Ug=
X-Received: from edwf17.prod.google.com ([2002:a05:6402:1511:b0:60c:3b8e:c3eb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:26d4:b0:607:f431:33fb with SMTP id
 4fb4d7f45d1cf-60c88b26b30mr16470283a12.3.1751366650570; 
 Tue, 01 Jul 2025 03:44:10 -0700 (PDT)
Date: Tue, 1 Jul 2025 10:44:09 +0000
In-Reply-To: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
Mime-Version: 1.0
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
Message-ID: <aGO7-SQUUgg6kSVU@google.com>
Subject: Re: [PATCH v12 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
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
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org
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

On Thu, Jun 19, 2025 at 11:06:24AM -0400, Tamir Duberstein wrote:
> This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> have omitted Co-authored tags, as the end result is quite different.
> 
> Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Overall LGTM. Only question is whether we should re-export
core::ffi::CStr from kernel::ffi. Reason being that right now we are
telling people to never use core::ffi as the integer types are wrong,
and I think it would be nice if we can continue to tell people "never
use core::ffi".

Either way, for the whole series:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
