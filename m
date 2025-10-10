Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40B6CBAC4C
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898AB10EB66;
	Sat, 13 Dec 2025 12:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5db6Br7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A690110E0CD
 for <nouveau@lists.freedesktop.org>; Fri, 10 Oct 2025 17:20:18 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-875d55217a5so254362885a.2
 for <nouveau@lists.freedesktop.org>; Fri, 10 Oct 2025 10:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760116817; x=1760721617; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xylsV5kIIIabKxOiN0kRoFNPX4aPhbzh0EYKMeP+Hkw=;
 b=D5db6Br7F17EXsk1WK7HO0w+d7eKShMvzxGPDH0hujYQ2ocrejmTqVbsgkR/RTsysc
 DYiDrT5lweSp+A0ErwHZOncnyzmABcc6fEZVSYAREj6Qbd5K/wGilicvZ5Cnxd8MWHeD
 AtzjznyTetmDro3sNkw/nBnUJjpIXZ74CtNjZOacM/eTFH02eKwgPEEJ4j7mtE6JZV/d
 NHkwxG1cU1bts7GEeoTl7ozQY2ZpT904HtnoNfvgcsPuSxaRK2cvkiHEojw28gTEHWwv
 DIj+kiM8JQvR3LyZ3mS9O4VmogmSS1E+o3WrpQRA9jExhxxK73ugsCCUiLM6eMVdEQ7w
 9pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760116817; x=1760721617;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xylsV5kIIIabKxOiN0kRoFNPX4aPhbzh0EYKMeP+Hkw=;
 b=P7tTa/ocf0NrTtO+NQs4GANwzb60V8Rh7jQjRWMyxfmdJ6RLOnS6p3AIBJFYEHMUeH
 rDlFfmewho48OBo4Bor4XONRscfiezkleevaiGckSK7QfRooNLB/1WdSJraX61WVzWFc
 aJpNfi34408JHnveZAeOG+K9YBSIM5V55SrVunELCm0PiJSxsmfZoaJFJ0evo7kLfOFb
 Z6OZNEUV0JRZoF+0W0DIuTdjejLk4prodcAMQgxhud89ahL41YyDHZvmmv9IAn5XMwhX
 BO3rAutvAGX3mjR6FoKhMADw3kr7nDQ7id5Hk/MnEWGuSLJVATatWM+gWgPR6dbU/Bvy
 6RrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXthkcVzi5jFMZyqCGPL3ZL+107bTFFGA7m6BZQ5EyAAaubCT8oUYtbEDbEDywKxCxev59avBjc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT3JRrd5HY2PPc3D2xRebvo/gNBJpYLPTx5qgeUH0nyGGfI2kl
 qlnt1Gq/k+3b0EoEIf+u8YkPe0Iu9RbytMffnbgfgqztANQXEScTCqSd
X-Gm-Gg: ASbGnctMwz72boWgciSijFvEWMg7YplDwCLwAghmoIFM93ONZt2rGWb3oGRiGcwGLsd
 nbgKtyleJO25b6KDTm9cBwxIjERBFXmUmjwBokOBuYBrJppS3o/6HDnt+tfK34POrDmtd0grPdp
 zu3KAiuD2lEIEIOfbdNikitHtqtCWtksSdBJHLp4hS8sUWC1wim73MKUvqFUkt55wAxg9l6y3fA
 vUhjwCoqOUrVKnPcxoyqbsFxDE+orUoDH5CHixt9Mz4LXN5VE57FgtGBsCWrk4CRb/sdeDgnUp8
 QrIVKjEAcDhzhPEex++LO5N81h0aLusdeP4nEYG/dwoTTCkjFeW+NVrhpWE0IOxNEY6kjhwJjrp
 TeYWYg4TDaYvJlmxCTHN6B1aInl7gmWsEIl0XcA==
X-Google-Smtp-Source: AGHT+IF3YmHCTvIfvD1GXE14cMoEXlCAzP1Rdx8G5vNHAkuYwhBNSOsWkfDL8D3LLQCVaHGU9tSuLA==
X-Received: by 2002:a05:622a:90f:b0:4b7:95f2:ddf with SMTP id
 d75a77b69052e-4e6ead54bb0mr159732141cf.45.1760116817164; 
 Fri, 10 Oct 2025 10:20:17 -0700 (PDT)
Received: from localhost ([12.22.141.131]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e70d134a3csm12356431cf.9.2025.10.10.10.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 10:20:16 -0700 (PDT)
Date: Fri, 10 Oct 2025 13:20:01 -0400
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
Message-ID: <aOlAQaDo5HwlvRUk@yury>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com>
 <aOflmmHe8O6Nx9Hp@yury> <DDEJ3X0C2RNH.13YEXJI3CTSPF@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDEJ3X0C2RNH.13YEXJI3CTSPF@nvidia.com>
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

On Fri, Oct 10, 2025 at 06:19:17PM +0900, Alexandre Courbot wrote:
> On Fri Oct 10, 2025 at 1:40 AM JST, Yury Norov wrote:
> > Hi Alexandre,
> >
> > On Thu, Oct 09, 2025 at 09:37:10PM +0900, Alexandre Courbot wrote:
> >> Use BoundedInt with the register!() macro and adapt the nova-core code
> >> accordingly. This makes it impossible to trim values when setting a
> >> register field, because either the value of the field has been inferred
> >> at compile-time to fit within the bounds of the field, or the user has
> >> been forced to check at runtime that it does indeed fit.
> >
> > In C23 we've got _BitInt(), which works like:
> >
> >         unsigned _BitInt(2) a = 5; // compile-time error
> >
> > Can you consider a similar name and syntax in rust?
> 
> I like the shorter `BitInt`! For the syntax, we will have to conform to
> what is idiomatic Rust. And I don't think we can make something similar
> to `= 5` work here - that would require overloading the `=` operator,
> which cannot be done AFAICT. A constructor is a requirement.

Sure, BitInt + constructor is nice.

> >> The use of BoundedInt actually simplifies register fields definitions,
> >> as they don't need an intermediate storage type (the "as ..." part of
> >> fields definitions). Instead, the internal storage type for each field
> >> is now the bounded integer of its width in bits, which can optionally be
> >> converted to another type that implements `From`` or `TryFrom`` for that
> >> bounded integer type.
> >> 
> >> This means that something like
> >> 
> >>   register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
> >>       3:3     status_valid as bool,
> >>       31:8    addr as u32,
> >>   });
> >> 
> >> Now becomes
> >> 
> >>   register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
> >>       3:3     status_valid => bool,
> >>       31:8    addr,
> >>   });
> >
> > That looks nicer, really. But now that you don't make user to provide
> > a representation type, how would one distinguish signed and unsigned
> > fields? Assuming that BoundedInt is intended to become a generic type,
> > people may want to use it as a storage for counters and other
> > non-bitfield type of things. Maybe:
> >
> >    register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
> >        s 3:0     cnt,
> >          7:4     flags, // implies unsigned - ?
> >        u 31:8    addr,
> >    });

> The expectation would be to use the `=>` syntax to convert the field to
> a signed type (similarly to how `status_valid` is turned into a `bool`
> in my example).
 
So, you suggest like this?

    register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
        3:0     cnt => i8,
        7:4     flags, // implied unsigned
        31:8    addr,  // implied unsigned
    });

That answers my question. Can you please highlight this use case
in commit message?

And just to wrap up:

 - all fields by default are unsigned integers;
 - one may use '=>' to switch to signed integers, enums or booleans;
 - all other types are not allowed.

Is that correct?
 
> >> (here `status_valid` is infallibly converted to a bool for convenience
> >> and to remain compatible with the previous semantics)
> >> 
> >> The field setter/getters are also simplified. If a field has no target
> >> type, then its setter expects any type that implements `Into` to the
> >> field's bounded integer type. Due to the many `From` implementations for
> >> primitive types, this means that most calls can be left unchanged. If
> >> the caller passes a value that is potentially larger than the field's
> >> capacity, it must use the `try_` variant of the setter, which returns an
> >> error if the value cannot be converted at runtime.
> >> 
> >> For fields that use `=>` to convert to another type, both setter and
> >> getter are always infallible.
> >> 
> >> For fields that use `?=>` to fallibly convert to another type, only the
> >> getter needs to be fallible as the setter always provide valid values by
> >> design.
> >
> > Can you share a couple examples? Not sure I understand this part,
> > especially how setters may not be fallible, and getters may fail.
> 
> Imagine you have this enum:
> 
>   enum GpioState {
>     Low = 0,
>     High = 1,
>     Floating = 2,
>   }
> 
> and this field:
> 
>   2:0 gpio_state ?=> GpioState,
> 
> When you set it, you must pass an instance of `GpioState` as argument,
> which means that the value will always be valid. However, when you try
> to access the field, you have no guarantee at all that the value of the
> field won't be `3` - the IO space might be inaccessible, or the register
> value be forged arbitrarily. Thus the getter needs to return a
> `Result<GpioState>`.

Ack, thanks.
  
> >> Outside of the register macro, the biggest changes occur in `falcon.rs`,
> >> which defines many enums for fields - their conversion implementations
> >> need to be changed from the original primitive type of the field to the
> >> new corresponding bounded int type. Hopefully the TryFrom/Into derive
> >> macros [1] can take care of implementing these, but it will need to be
> >> adapted to support bounded integers... :/
> >> 
> >> But overall, I am rather happy at how simple it was to convert the whole
> >> of nova-core to this.
> >> 
> >> Note: This RFC uses nova-core's register!() macro for practical
> >> purposes, but the hope is to move this patch on top of the bitfield
> >> macro after it is split out [2].
> >> 
> >> [1] https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n@gmail.com/
> >> [2] https://lore.kernel.org/rust-for-linux/20251003154748.1687160-1-joelagnelf@nvidia.com/
> >> 
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> ---
> >
> > ...
> >
> >>          regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
> >> -            .set_base((dma_start >> 40) as u16)
> >> +            .try_set_base(dma_start >> 40)?
> >>              .write(bar, &E::ID);
> >
> > Does it mean that something like the following syntax is possible?
> >
> >         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
> >             .try_set_base1(base1 >> 40)?        // fail here
> >             .try_set_base2(base2 >> 40)?        // skip
> >             .write(bar, &E::ID) else { pr_err!(); return -EINVAL };
> >
> > This is my main concern: Rust is advertised a as runtime-safe language
> > (at lease safer than C), but current design isn't safe against one of
> > the most common errors: type overflow.
> 
> Not sure I understand what you mean, but if you are talking about fields
> overflow, this cannot happen with the current design. The non-fallible
> setter can only be invoked if the compiler can prove that the argument
> does fit withing the field. Otherwise, one has to use the fallible
> setter (as this chunk does, because `dma_start >> 40` can still spill
> over the capacity of `base`), which performs a runtime check and returns
> `EOVERFLOW` if the value didn't fit.
 
Yeah, this design addresses my major question to the bitfields series
from Joel: setters must be fallible. I played with this approach, and
it does exactly what I have in mind.

I still have a question regarding compile-time flavor of the setter.
In C we've got a builtin_constant_p, and use it like:
        
   static inline int set_base(unsigned int base)
   {
        BUILD_BUG_ON_ZERO(const_true(base > MAX_BASE));

        // Eliminated for compile-time 'base'
        if (base > MAX_BASE)
                return -EOVERFLOW;

        __set_base(base);

        return 0;
   }

Can we do the same trick in rust? Would be nice to have a single
setter for both compile and runtime cases.

> > If your syntax above allows to handle errors in .try_set() path this way
> > or another, I think the rest is manageable. 
> >
> > As a side note: it's a huge pain in C to grep for functions that
> > defined by using a macro. Here you do a similar thing. One can't
> > easily grep the 'try_set_base' implementation, and would have to
> > make a not so pleasant detour to the low-level internals. Maybe
> > switch it to:
> >         
> >         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
> >             .try_set(base, dma_start >> 40)?
> >             .write(bar, &E::ID);
> 
> `base` here is passed by value, what type would it be? I don't think it
> is easily doable without jumping through many hoops.
> 
> Using LSP with Rust actually makes it very easy to jump to either the
> definition of the register, or of the `try_set` block in the macro - 
> I've done this many times. LSP is pretty much a requirement to code
> efficiently in Rust, so I think it is reasonable to rely on it here.

OK, then this one is also addressed. If LSP is a requirement, maybe
it's worth to mention it in Documentation?
