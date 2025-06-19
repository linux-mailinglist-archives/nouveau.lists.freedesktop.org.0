Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8A9ADFD4D
	for <lists+nouveau@lfdr.de>; Thu, 19 Jun 2025 07:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6175610E208;
	Thu, 19 Jun 2025 05:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nn3xtC/2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAC910E208
 for <nouveau@lists.freedesktop.org>; Thu, 19 Jun 2025 05:54:15 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-235ef62066eso5560665ad.3
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jun 2025 22:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750312455; x=1750917255; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mNX8x8v1rA4gsmPSGKn+LRzfhgT9AcyvzOiTf8D9D0s=;
 b=nn3xtC/2qgX77n3YxW9c5GtWpCxDGg0afe1jOkXSZw7VqDFjkemtkde2+eSM75IuqN
 Bld1ktrN/YyMXWcqd/yYhtxYRItNOYKN8T530jBGeQIyOT5ROY7r5cE4rjKdi9sBgCWC
 9HzVOKSATMiIEXDiBvnOSNtH1QHCXH/x9RryEzHjlyFh+UbhbPlyxvN+gkuaE3hWPxRa
 vsB8QP5D5K19gkFWXPsaiwsDa7KUUlmX1Ac4RoUqozkP5aHo+P68YoVbzyavEA3DxImT
 mwghfKuTKlsiAdgfvo54X5K/vW7BtRU30BJfXsTWVvqhusLJtvX30vJsHxv4RKR6BadG
 BAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750312455; x=1750917255;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mNX8x8v1rA4gsmPSGKn+LRzfhgT9AcyvzOiTf8D9D0s=;
 b=AnB/JxzM5UYMhApErw7znLbyT0B7DC3YHZq7mslnhfRUOcYQx06PYINSuVf5h8PmN+
 qe8Ag2En41WwZNaG807p5DG8KjJw9V8gOFxf9fa2zPl0tbHp0j/KapSiEStPzK4/vwak
 7C9KO4v/+WTET8jqqO8fIVQ0BEf3X2ZU/NO2leFq/EGhvBSgbzfqOiQ+Bg9AL+iQX9jp
 9mLNBywYfBC27L5fkb6RWuiEPNCp3m7GYB39T3SV+8tgwGG4zVTnn3ojv9teTh46ZZVU
 9wzOeHNWJSGqmv2ygKU6HOjDuLSximYEknAqKQFlu3OsjhIh50LTpQzyu1ipQwg9J8x5
 wupw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqZRKJsAUcwEcEyguwZLjD6I8M4kMa2PbRZdRXnk6yHpOQqBwEUfb51Q/1sdNGWRhrh0YBqFVY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuwjDIrVpZZ+GlnLZ1heZJ5WHXz/yp0kBdCIGvjAoX8JVOSX6C
 vlqf1qZiyajrOiIOQx8zsvSoca04kSLx9fkZEB2OXliYs28jCPEyoWnhvlP8NgxUD1vEMlFobBW
 N9rf3
X-Gm-Gg: ASbGnctjLMKUGzioy1XN/MNM7+9QlN4godCOgWKY+8BBVLmP8Bt8g/7EC8JcTX+MhRU
 AKXnmc8SVehN9jaEXq5eol2+EVP502gaY1yoCMHoLpWu8aSsH5n0p7hcnUZ1MzootZ64m4zF9xM
 DV8ikFda5BluRF1LFVniSdT1rUO9u1nX+AzyDu/2BYloYzj9TgvbvsEPbxbjCbl+/ttOC7bzZ8V
 j/N8qKwvVXi30Bk1mOTsWUd0vMckJs+XKEOwEOU3p4QXP/4I9ONx9nA//V5YZrQrvhRW9qu4H3M
 aOrfipEKHNEz8uw4LCFxvComvgn+5oDnJuwub8otFINm4eZRhbRK4PAyxuSg3/o=
X-Google-Smtp-Source: AGHT+IHpBy809k4j/mgtJ3pLZAei1vSVsYHbL1LodLYl1qhBrEB6gEr4Vdl8NOXI+5UF/UVojJEPMQ==
X-Received: by 2002:a05:6a21:8dc3:b0:21a:ede2:2ea3 with SMTP id
 adf61e73a8af0-21fbd4d2985mr27026444637.17.1750312442235; 
 Wed, 18 Jun 2025 22:54:02 -0700 (PDT)
Received: from localhost ([122.172.81.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900b04e4sm12287505b3a.121.2025.06.18.22.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 22:54:01 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:23:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Benno Lossin <lossin@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Breno Leitao <leitao@debian.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-mm@kvack.org,
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v12 1/6] rust: enable `clippy::ptr_as_ptr` lint
Message-ID: <20250619055359.tormmysgxxcper6q@vireshk-i7>
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
 <CANiq72mfjzXj0f4PKPKg7QgbOrhay4CF_+TBgScecKWO6acmyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mfjzXj0f4PKPKg7QgbOrhay4CF_+TBgScecKWO6acmyQ@mail.gmail.com>
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

On 18-06-25, 18:48, Miguel Ojeda wrote:
> On Sun, Jun 15, 2025 at 10:55 PM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > Apply these changes and enable the lint -- no functional change
> > intended.
> 
> We need one more for `opp` [1] -- Viresh: I can do it on apply, unless
> you disagree.

Please do. Thanks.

> diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
> index a566fc3e7dcb..bc82a85ca883 100644
> --- a/rust/kernel/opp.rs
> +++ b/rust/kernel/opp.rs
> @@ -92,7 +92,7 @@ fn to_c_str_array(names: &[CString]) ->
> Result<KVec<*const u8>> {
>      let mut list = KVec::with_capacity(names.len() + 1, GFP_KERNEL)?;
> 
>      for name in names.iter() {
> -        list.push(name.as_ptr() as _, GFP_KERNEL)?;
> +        list.push(name.as_ptr().cast(), GFP_KERNEL)?;
>      }
> 
>      list.push(ptr::null(), GFP_KERNEL)?;

For cpufreq/opp:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
