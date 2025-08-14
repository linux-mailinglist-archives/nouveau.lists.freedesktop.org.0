Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C91B25A57
	for <lists+nouveau@lfdr.de>; Thu, 14 Aug 2025 06:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8817410E0EA;
	Thu, 14 Aug 2025 04:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BgqhXEDS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D77910E0EA
 for <nouveau@lists.freedesktop.org>; Thu, 14 Aug 2025 04:15:11 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b47174edb2bso297890a12.3
 for <nouveau@lists.freedesktop.org>; Wed, 13 Aug 2025 21:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755144911; x=1755749711; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sWxfCtON1zed9A8C3GYhEYa8VInQ0SpyFdE2rQUbX1c=;
 b=BgqhXEDSSHqsKpjTjuvxtJp1oVNhTa5/AOqYO2CTTY5C577rKx7lvVAq7mtR4VEGwS
 Y56MqnpQsHuVSYnn4qwuwYSrXVXXFI5j+rPCETuaW3Lu1faZLU0z4YdYNazJ0ZoeUnd5
 0QHPmwTEZOJrVUfNVStAwfLJrY3ML7eZOnV0o5zao15Wjv8bOGgH8kaSx38XQ53UzbpP
 PC9vFgFUJtKuoo4ouQIy3sMe5AWkdd0UIHmNKs2znPA+I/AaBHzCm2q58H1wTsrEWohx
 HSiSpsA1k5KNVob+m1RsQwW2fGjcOpCZDmvPO9PhjOulDfiTExMgO8VT9nHRzlQu7SbM
 rWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755144911; x=1755749711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWxfCtON1zed9A8C3GYhEYa8VInQ0SpyFdE2rQUbX1c=;
 b=irSKq+qaBaaKfBFIZsyrKHJplEQJGJ0IAqccwz5+1oHI9vIVcK6ueW84BEsSRmeF70
 cwP3DZtlwm9dc2Qau8ElBVt53vqCj+tk6jbVCEzAJsu/WO9/NNFX0D9Ek83eLKasuBo8
 mXE1XrWgMUD/gkwc5DiFIMdJbscpCtJlyIaQyAr+kAAmgCgkOqUmfaOlcXCvEMKQafnH
 jshkUXIU+B15TgN8SXSll6XWzFuUsNJYy6A/cJN6HvE+r0WsVhxcHMRUzpCxUn6TExxH
 Pj/FakSqaGFFQ273vFRKFUBl6RiY3ortw6I7o88nRdsjgOQc9uTzxkHsGD5CuvdAlXVG
 Ncgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt3h0F3ACKiuMaNmdeg1+C9MjhXgQWzpYEgZ7Z9P6DBxZ6UtL9k/OavLPyayTG2ZQPhQ30sTIC@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya6QNk8OPU+WA/mPUXs2gBwIdsOAZssmJOQNrebpFfxvEszFRp
 a+zXx8oXv14GrYXQEx8r64uNN3gvnddhbXY3F3SnpMClb77D38ynlZucxGEnM1vURx0=
X-Gm-Gg: ASbGncvZUrHkMxp6XKYUl/44fIW/3BwAwfpuAeBzqkGid6Yz/0t7jt7B5YGtlEuYFQp
 yrRP5DCu6AeZc5dJ+c/5LZqxz2R8D8R2Ms89jetxtfwnJfzveXYzL++cv6bSADfrx6PFkkxd857
 vBlkScZns1Ee2UBgz6AlSHaNb9G3K/kWEBXZ2CLINYLQJhv9+zuVQLixc4RoTtFKaX5oFccoiBA
 5FmsaH2EBx/XqvEOAUhP3OFrjy9NE0h9zHsVqwCpmhdHcqmdJojKWWFbecfNcGxk5XshOmcPANA
 +KfE/8vFTZIFy4sePY3Sp7AdfpeOu25ir2KyEFFshqzGwNMkziLA7WYO7EWG8X/7whW/f5jeVNS
 HyRbzHSYfVuhwMfHYjTy+W+OJ
X-Google-Smtp-Source: AGHT+IHt40bX0FwSrzcBQt9NOrie8YIvE0Bd/aZbf1eDUrCgWfF/cOlo6cUv942myCO6XkFRZpWJjg==
X-Received: by 2002:a17:902:ef46:b0:243:80d:c513 with SMTP id
 d9443c01a7336-244584c278amr22862505ad.4.1755144910690; 
 Wed, 13 Aug 2025 21:15:10 -0700 (PDT)
Received: from localhost ([122.172.87.165]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef6e45sm337724835ad.22.2025.08.13.21.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 21:15:09 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:45:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 06/19] rust: cpufreq: replace `kernel::c_str!` with
 C-Strings
Message-ID: <20250814041507.sqkdumgaxfcalkhb@vireshk-i7>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
 <20250813-core-cstr-cstrings-v2-6-00be80fc541b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-core-cstr-cstrings-v2-6-00be80fc541b@gmail.com>
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

On 13-08-25, 11:59, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs | 5 ++---
>  rust/kernel/cpufreq.rs         | 3 +--
>  2 files changed, 3 insertions(+), 5 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
