Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43D4CBAE0C
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5AE910EBB0;
	Sat, 13 Dec 2025 12:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXviROPu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206BC10EAA9
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 16:41:01 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-71d6051afbfso12644167b3.2
 for <nouveau@lists.freedesktop.org>; Thu, 09 Oct 2025 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760028060; x=1760632860; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OEYS4ZG7BzvAgxNTt2hNL73MyYfFtHwZYP++pTe5XoE=;
 b=BXviROPuBAU48TkmDYs6EBVW56xJgYXjQ/P/J/rCaR2CAz5Z21ekkM4zD+TETAD3ss
 tba7FbeUoOk8IGWUWKIwnbDlZZ/3DqMgG3R4iyf5J7K6+4YPeyLaC5ggYDf2YLfEBvKB
 27Z76VA2Btwl2+OBYdk6f1/8uVf+b1J9Fi2vLUAO8ua6k9H/t5iqtuujXfU/FcoEPbHt
 UaudDDiM1J4XrnmlgcMRaJt6uf6x7deLnj9hq2sblS/ZVVWZU9QARpIs+VHFQnryNBcQ
 SKbsyxITfjO2u+kN/oyUd3R6qphsdpd2TrUNNQbys2PtJymPqRnGF4y3af5nGLeI17Cn
 RzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760028060; x=1760632860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEYS4ZG7BzvAgxNTt2hNL73MyYfFtHwZYP++pTe5XoE=;
 b=QmlawlqLJNtDXq6w9mxF+MFesJysK3UR7F7xtaxhst+AB069DF21Atma2n0BmVFlgJ
 HpFesXg56tsRpH1rnbinc+sf4kxBMM1hhtn92G2/FRJieXxX2Swca7DZrLJiwQfvPwMJ
 NLuhTqKPp6ru28IH9YSe9NE8c3YYQ0vNgb3tTsB7T1sUlNGih1r65AglxM7plKO5kkjq
 xsdtWFsmWSmRuAz+dCM2KgK00tSVXx30SvVSHwdI7DjIorhLo/wmrf5DfFcOsvCKCFpC
 DerEzgxJbC4y2ptNtLyTO810aY7pQvrluLvDdxJEa2xreu0/FB3R/RenvblAgCh20lQM
 pWWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGqkeXAXehpvdNCSPHa89mbEVgD6Z5Hwge4MtXWFyCKZ8/9+T1IeTZglHjHdanrLZh57n/kIxY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZjfBuZkNFCXiv/ZVLgiG5b6hXblmqA1pDpB+oCRF+D8cy00Rc
 c2U+Ag00G8Gp7RGL3O2g+Qhz6UvpGbUIFO1fPZlGcYyHW/l1lht/Wigo
X-Gm-Gg: ASbGncs1fa9JOtDY1qe3GI6Xq94z1kcQ8qnDgSeIccrAE3wUQYm+jFe2tPNs+kTotSE
 vDZ14I5u+aApPdOMMvFkRTeeI5yhnWtQHaAjfQMoNcLHqeXGm502C6tzPvm6RyIGqFh6f2n6N6m
 uFnBB7hy8nlWS6FXT40cUs8YfCSR9jeefT1x1bqPru/hoU1j81dBNeQRSfbILFeHxOqLBoLvXe/
 1/nsTgrc9Nne2mCHq0zD4fkos8FgFs9ANVlDEosAosHw2trOEcS7unEhtxt25/uyfrneOu4Qdh4
 7pByk+fQ/FZMOJUHrG13ihrQx+qay8sen5pmpNCsTnLNz4jqX/hHX4rHhA4QJaiy1eEvJC66Adg
 VhymKEajra5QLO9+VymTx8XP7rU8W33pcoxuThJRXApUXMmnGjwbQtKOV9D6psXrF3HzZR0b5rx
 Go9iY=
X-Google-Smtp-Source: AGHT+IE4I8ejY06OQV5+iuuha8UY69T0yHmq+uCkeg2u0Wguug06p8yYPejnOQd8b6WXnlG7VNxZFg==
X-Received: by 2002:a05:690c:4d43:b0:76c:e8b7:a625 with SMTP id
 00721157ae682-780e1476fbdmr110455167b3.21.1760028059826; 
 Thu, 09 Oct 2025 09:40:59 -0700 (PDT)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-77f81e4d6dbsm74906357b3.59.2025.10.09.09.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 09:40:59 -0700 (PDT)
Date: Thu, 9 Oct 2025 12:40:58 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feong@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
Message-ID: <aOflmmHe8O6Nx9Hp@yury>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:49 +0000
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

Hi Alexandre,

On Thu, Oct 09, 2025 at 09:37:10PM +0900, Alexandre Courbot wrote:
> Use BoundedInt with the register!() macro and adapt the nova-core code
> accordingly. This makes it impossible to trim values when setting a
> register field, because either the value of the field has been inferred
> at compile-time to fit within the bounds of the field, or the user has
> been forced to check at runtime that it does indeed fit.

In C23 we've got _BitInt(), which works like:

        unsigned _BitInt(2) a = 5; // compile-time error

Can you consider a similar name and syntax in rust?

> The use of BoundedInt actually simplifies register fields definitions,
> as they don't need an intermediate storage type (the "as ..." part of
> fields definitions). Instead, the internal storage type for each field
> is now the bounded integer of its width in bits, which can optionally be
> converted to another type that implements `From`` or `TryFrom`` for that
> bounded integer type.
> 
> This means that something like
> 
>   register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
>       3:3     status_valid as bool,
>       31:8    addr as u32,
>   });
> 
> Now becomes
> 
>   register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
>       3:3     status_valid => bool,
>       31:8    addr,
>   });

That looks nicer, really. But now that you don't make user to provide
a representation type, how would one distinguish signed and unsigned
fields? Assuming that BoundedInt is intended to become a generic type,
people may want to use it as a storage for counters and other
non-bitfield type of things. Maybe:

   register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
       s 3:0     cnt,
         7:4     flags, // implies unsigned - ?
       u 31:8    addr,
   });
 
> (here `status_valid` is infallibly converted to a bool for convenience
> and to remain compatible with the previous semantics)
> 
> The field setter/getters are also simplified. If a field has no target
> type, then its setter expects any type that implements `Into` to the
> field's bounded integer type. Due to the many `From` implementations for
> primitive types, this means that most calls can be left unchanged. If
> the caller passes a value that is potentially larger than the field's
> capacity, it must use the `try_` variant of the setter, which returns an
> error if the value cannot be converted at runtime.
> 
> For fields that use `=>` to convert to another type, both setter and
> getter are always infallible.
> 
> For fields that use `?=>` to fallibly convert to another type, only the
> getter needs to be fallible as the setter always provide valid values by
> design.

Can you share a couple examples? Not sure I understand this part,
especially how setters may not be fallible, and getters may fail.
 
> Outside of the register macro, the biggest changes occur in `falcon.rs`,
> which defines many enums for fields - their conversion implementations
> need to be changed from the original primitive type of the field to the
> new corresponding bounded int type. Hopefully the TryFrom/Into derive
> macros [1] can take care of implementing these, but it will need to be
> adapted to support bounded integers... :/
> 
> But overall, I am rather happy at how simple it was to convert the whole
> of nova-core to this.
> 
> Note: This RFC uses nova-core's register!() macro for practical
> purposes, but the hope is to move this patch on top of the bitfield
> macro after it is split out [2].
> 
> [1] https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n@gmail.com/
> [2] https://lore.kernel.org/rust-for-linux/20251003154748.1687160-1-joelagnelf@nvidia.com/
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

...

>          regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
> -            .set_base((dma_start >> 40) as u16)
> +            .try_set_base(dma_start >> 40)?
>              .write(bar, &E::ID);

Does it mean that something like the following syntax is possible?

        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
            .try_set_base1(base1 >> 40)?        // fail here
            .try_set_base2(base2 >> 40)?        // skip
            .write(bar, &E::ID) else { pr_err!(); return -EINVAL };

This is my main concern: Rust is advertised a as runtime-safe language
(at lease safer than C), but current design isn't safe against one of
the most common errors: type overflow.

If your syntax above allows to handle errors in .try_set() path this way
or another, I think the rest is manageable. 

As a side note: it's a huge pain in C to grep for functions that
defined by using a macro. Here you do a similar thing. One can't
easily grep the 'try_set_base' implementation, and would have to
make a not so pleasant detour to the low-level internals. Maybe
switch it to:
        
        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
            .try_set(base, dma_start >> 40)?
            .write(bar, &E::ID);

Thanks,
Yury
