Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E2B25A61
	for <lists+nouveau@lfdr.de>; Thu, 14 Aug 2025 06:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B456310E204;
	Thu, 14 Aug 2025 04:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IQvcdyWG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60BC10E204
 for <nouveau@lists.freedesktop.org>; Thu, 14 Aug 2025 04:15:38 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-76e2e5d244cso602437b3a.0
 for <nouveau@lists.freedesktop.org>; Wed, 13 Aug 2025 21:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755144938; x=1755749738; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=34KWmLyAieUzqtSrdM5jM6hi2YW8C3abPtgGolrQZzs=;
 b=IQvcdyWGyYFC9QsnOOC9BVPx3ikASsy/5vFQzdPitdY054pWOEEVoyU6tJiOEZKme1
 ICxKnQRVA4YTgOC8RMMVl3QMUUX9fS3ixN7hmvZ2cRx+dvorHQ/WXql12wz4Ppjy4geD
 t8weVQW0XnYQf/94mRPbKsNyHgGWy/HBI0/36YjuXYQFNSnnWvu35RPtLZwaz3XaiH2R
 HbwqcAHIxM+8h5KjPlPFhc0tykCN9NO8yxXnWbglOckRkFvvABOZsqTbfbyR4u7tomnC
 IV3oaDGjsPzYbv09pf+LFpeiQLpkbwpFIR8awei6NP4wJOrfUQDKfsaLFML4DjTiFpZd
 7LRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755144938; x=1755749738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34KWmLyAieUzqtSrdM5jM6hi2YW8C3abPtgGolrQZzs=;
 b=NoKn+FKmDSpGb3/p1D/Iu5n44eYPSxTjc8wlzYOOPp1dtipFcqbyMlyx1853tehY10
 pEohZN2+rR2GyrtZ3vrgUmUr3BoS4tD+lfIEQnWJVvDaPoQsYu0p4rbPnDYFdB/k/80k
 gtLf+YJ5P9BWfyYa+oy24TiL1xwftOZzHfJlP4ZVMYgYdGe/ICdhqBlli8CP7vsjXmfe
 XJ+JxNFnGBFjop7Go/Vbeby9uRtcDho4trSbbGtCB5qAwFJ2zxQJOy9kyFTm/oNhpP4X
 s/HfQWz6kgVAvt7nc+9j18BFEUrTkeQZZ4HVEHJTLzYdRIJYcFZrbYpWDLWM49RVBKwJ
 3zxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwfBi0kZ5ig/dw/RbXI8ZCd6D3Jv9wvK3Z5SFfiLWgkmoSfLehmLerDDOulHp/rsWu4dO05eRY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxPKMFFa392QnuBBL78P6E2f7ppT5Rkmnd7ThWeKhquIINddzN
 xkJ5XYNTb+wspguyusuequgBNfP85s0Cs+sT9Ejcyui1SMByo2LrtLC25DUhHEKEmPI=
X-Gm-Gg: ASbGncsUHn4IHq38L6Id4bHrijuo6mpK+hBy3IWtxb86kp06gnmgIOLFzeutPBDC/Mg
 sOeaIAJWquTHrJvhNypaXLxy5y5EK4oLUPtYmkVtS2DBsOrq9D/YPWR5thsCzWb9dPOPVYtZ72f
 U8TqK0Y84lHz3qeVLd5nYYn8L1RduExadYOa0L+aK2/hTpf5vNL3YWKD13jZGeTAqtNx+qgKNAz
 2zZqzBYEGxwruJqvcwag1lvL+NyX39/+VbgPlJpTiTOpR4F1L80Q4izZ6od3YcOof9eTtC2rq8W
 DjMQqyrPhgfGejFlqYvs4EsO3c2W+5sfAhDMpgsPEChiRO9ZcJT9HDhQPyBL+TbNwtH+4tjeQTY
 kJkK8Y/te4Ilq4kHzYQE2daiv9zUMLeFYj54=
X-Google-Smtp-Source: AGHT+IFKmQVKtrRTGaZ8hTWhd7nE8H1E8AgUXml21TmSiOXRMbfiiTxpX/j+26/xYc1Zfc3ne6Vv/g==
X-Received: by 2002:a05:6a20:7d8b:b0:240:1204:dd5 with SMTP id
 adf61e73a8af0-240bcfbba85mr2301691637.8.1755144938050; 
 Wed, 13 Aug 2025 21:15:38 -0700 (PDT)
Received: from localhost ([122.172.87.165]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd9795200sm31652911b3a.114.2025.08.13.21.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 21:15:37 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:45:35 +0530
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
Subject: Re: [PATCH v2 04/19] rust: clk: replace `kernel::c_str!` with
 C-Strings
Message-ID: <20250814041535.l7yj2wm4ae3l4k7p@vireshk-i7>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
 <20250813-core-cstr-cstrings-v2-4-00be80fc541b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-core-cstr-cstrings-v2-4-00be80fc541b@gmail.com>
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
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  rust/kernel/clk.rs | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
