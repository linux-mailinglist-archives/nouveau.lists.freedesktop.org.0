Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB19AE359D
	for <lists+nouveau@lfdr.de>; Mon, 23 Jun 2025 08:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503C110E185;
	Mon, 23 Jun 2025 06:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mdFri6u6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A6F10E181
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 06:22:13 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3135f3511bcso3942079a91.0
 for <nouveau@lists.freedesktop.org>; Sun, 22 Jun 2025 23:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750659733; x=1751264533; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZjaVo7z5thcmzA/Idtk2W4NhEJVEWcJtCaNKpGwgS2c=;
 b=mdFri6u6ksgQ2EaEqFUTaC2IcFOCOiyqyBrKcT5ke63eYU8GZ/0OX0hmGZsVsK/6y6
 QjZyn5fawiU9Nvqh0ZAQ4AUrgZjwRB1+g9TclxXSHVguKwOaverbFmPli1vUJfA65VRh
 eqYb3EjQvkvA84u1TAO6o+WY41EOvATapP8dc9xq4LFsVN0TyMRL9CPHk4oipd4IBYuE
 Q/2H/ncMkjiI8Xfm04E+IUiEKh7Q6x7+g/um3/F4cF2AI6JSqvkCKvMQoK8NUpEyIdvx
 Nb80mbwDx897XKD2xePNmKS3MA6ilCAXFIl1jhq4rJAtfi3/Z3GOfkxpbuhVn21y1iT2
 VKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750659733; x=1751264533;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZjaVo7z5thcmzA/Idtk2W4NhEJVEWcJtCaNKpGwgS2c=;
 b=kKTvS+Gc8nEQOmiqZtfRwlOTwEPoEFJPo17beuqOilV9ZAx7iQa53ksCz6Rc8LDaCy
 Zl8GqNu9gtimj//bxseBEjABlb5q5/9g+MuoMfMlLOXeaFKDw94f2+UCgsvNzxg2TDp3
 wXH99nZsyU2n6Cfs/KLQebkITqkQJO2DRlGpuCQj23as2w0XZCg1hiDj6ZpO7tb3aj2L
 cgvbgm/oHo6a7tkaH0DmsXbB4RZPx/IT9R/57DcE1SkflAq3k0WSna2QPeOC+qkQuub1
 J0kDa5UysPxHGGieeT3Ha9hH+Ud8E9sLQ97gVco53w1ldOJ908z5chvOcoEekmoMMND+
 Uv1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt97XdHQ/chwoSdTBacKLnyAcCJgsXaQzw716rg2POhAxOny+ltvxPCgpEMNfiPbpzvhmaNN8/@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4kpQ2mIKyH6dqdkCPqd6qvpeZXr91j9lELNhtRma5HupOQ3RM
 skIR3EyzV7p+6Ixe5/tm7no/wF3dzqji0svQ3G9Y/D6SL+8fBxLyLEB71zsx7tzCzZ8=
X-Gm-Gg: ASbGncs0Z+8i8yjFqlZH/l9+bHbymXxprB564AXtD9UlXURigVf9XtcLd5P8jl5xCDw
 hwNf+bMU3gtX68cDGp42pO6QhP6R1hHpptlA/me9qNiwgOlmhNU0Xf9Uinbi8XoMYofpqCBbbBu
 RoyM0VoxtW7gttmkal76eOpGC//eJ1UPzPeeoCMflZPUCWuH7ggNaKPyXU2cXV3zRo+3NeO6w1/
 w0HigFMIDIdh38LvJtc0iMzuxPbjSv9lzi0mIsfd5NM0SQ5kBztKrPwmLkNOiZZqAqpWa8yOBGS
 ubryvJiQ2MIi9LPRzcRceBHzyQd2NpjNbuARkw3kTUAUo4Cf3TxgK1nk5oRzVlM=
X-Google-Smtp-Source: AGHT+IHTC8DDc643Bby1AguMJbpjpU8RoaZSO7asfpNMZjv5HFpnG7zervZfVFZEkHAcEV/Plpb2eg==
X-Received: by 2002:a17:90b:1fcc:b0:311:b0ec:135b with SMTP id
 98e67ed59e1d1-3159d8d6282mr19886141a91.24.1750659733212; 
 Sun, 22 Jun 2025 23:22:13 -0700 (PDT)
Received: from localhost ([122.172.81.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d860a3c9sm75875175ad.95.2025.06.22.23.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jun 2025 23:22:12 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:52:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Breno Leitao <leitao@debian.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 4/5] rust: replace `kernel::c_str!` with C-Strings
Message-ID: <20250623062210.she33z5hfouu5jgj@vireshk-i7>
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
 <20250619-cstr-core-v12-4-80c9c7b45900@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-cstr-core-v12-4-80c9c7b45900@gmail.com>
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

On 19-06-25, 11:06, Tamir Duberstein wrote:
>  drivers/cpufreq/rcpufreq_dt.rs        |  5 ++---
>  rust/kernel/clk.rs                    |  6 ++----
>  rust/kernel/cpufreq.rs                |  3 +--

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
