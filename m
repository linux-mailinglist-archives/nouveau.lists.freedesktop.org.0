Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A82CBAB9B
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBDA10EAFB;
	Sat, 13 Dec 2025 12:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFjJyDTO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E07710EAC7
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 18:28:13 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4d9f38478e0so13711441cf.1
 for <nouveau@lists.freedesktop.org>; Thu, 09 Oct 2025 11:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760034492; x=1760639292; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=m5CEm/k2cKSkdb8l0Unz1Qn9/RiaqPf8uIpBe3eDtIE=;
 b=gFjJyDTO1kKXdV8Dr1aVriW4ZUprth92t3eAncGQyZnBqiCari4oAlB5uxT01hkbG3
 BczwJefAN2y09q218aZQFjVfxKK2LZIbbTfxC4NF+8YPdZ8PE6OySIWdhaeNxhHUXOWl
 YxAlhVFT2xTJxdSr3xk+GgeDjhvza4YFATlPM6YyWmuq9ehh0bDMZp91HqZQnZZwt7cf
 +1BjfLwzYq+cV0hSXj6eAzQsuR6A6fqnAH5QJRVnsdf8e8X+5MAO9RH9mFpgZcPhJym3
 b3X8Desb6jNKqLG127RNcAuLx0LiKlpSF3N54nlU5J/AvBLcGcfuj6v9/xHjbXkynm5I
 grAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760034492; x=1760639292;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m5CEm/k2cKSkdb8l0Unz1Qn9/RiaqPf8uIpBe3eDtIE=;
 b=Epdn55tz1S1cXpmE1aemjpbTdzHKR4MEuEirtRdvEU4QsD7WGcN6r1x8Dc7T5aZbub
 D/2mG4objbTyNigv+AeqonWc/+O2vZRK0Ho/xoLdEb9uC/t5lnqR3oMZ6Nr+WD5hK+bH
 YhHyfOm1r6RtQCtMoIe91us66kpu4niqMuh6RcNtUrwAYNzncJhyMvHv3rGCW/UoCawD
 D8GJpvZ490DF1Hd+tCacxvjApu+GWQVH5sfD+V9sBPLVg24jl3ZWYIPDlBBmXdaIE6rC
 fpx70p8QINqAS14ET+5pqy0AdoB5sI3BdDgRyWyO8VoQh/Mzhc5ft13JHz8zxWTY2mpA
 eu5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqL45QpNqzlh/9wgUgUU4JplWbzysDZD50Ss4gk8P3HWoFV6fs/TQnJ8q5f0LP6zogphCUcw9H@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztqw+x70MZbxAn8tHfl2ZexynkZCSZ8UljhfQVkxFpXJRM7hlA
 5IzeNLRwC2WEza0cNS0DtKtMItgp9HKvekx5opLHs6oUFZ84dEP1fb+o
X-Gm-Gg: ASbGncusHLRVpXwaqHHMXxFrsQVYAncOnPA0z2IwQxm0dPwg+8Qe/ILPyE6QiOB9AjZ
 JIKNrM4w+6ldw5U4MCzXqiHGvo277Qn5edqFngA9t/myZN11a2kpieWnNr8OCWG2M7uejp641V2
 eDrBe2WOTAR61CZLVkV6h8PlNIpBiPTd1iqn6EMOicYJbgKMRF25DcJKcs7y9OKOkA/WxtaM5gB
 BUqnEeBns0A5O5vobU93i3MC+puI6Gie444EW20vjZIK9rLQiOIrY0ZQm2mF3UTmWmB0FDPguna
 dzwSWqy07FvQeJXgkGDOg/Z7s1MI+R52zpLCOnm7DzI3AfZRE+7GLf4B+RzsUTMgJeePpRyxd5b
 DBDWr+WeRP4xtO3j1G24uI7fu3XVbx+6TG63bNwf5hvCQGdLDeepfGw==
X-Google-Smtp-Source: AGHT+IF00kjXS/Ks4W3W0yL60FVuYiaJ0yikXglyJUl4wFsoNXCdTMygWhDLSE1zqjZH94GRSgJ02Q==
X-Received: by 2002:ac8:5d4d:0:b0:4d2:ba6f:28fa with SMTP id
 d75a77b69052e-4e6de8b5d39mr194435231cf.34.1760034491694; 
 Thu, 09 Oct 2025 11:28:11 -0700 (PDT)
Received: from localhost ([12.22.141.131]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e706b96a97sm2841951cf.5.2025.10.09.11.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 11:28:11 -0700 (PDT)
Date: Thu, 9 Oct 2025 14:28:09 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feong@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
Message-ID: <aOf-s-XuhbN7MUlx@yury>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com>
 <aOflmmHe8O6Nx9Hp@yury> <DDDYOBOZTF7Q.124VJDF4C76B6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDDYOBOZTF7Q.124VJDF4C76B6@kernel.org>
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

On Thu, Oct 09, 2025 at 07:18:33PM +0200, Danilo Krummrich wrote:
> On Thu Oct 9, 2025 at 6:40 PM CEST, Yury Norov wrote:
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
> Rust is a different language and has its own syntax, I think we should not try
> to use C syntax instead.

Up to you guys. But having in mind that C is the only language that
really works for system engineering, I would rather consider to stay
in line with it on semantic level.

If your goal is to make rust adopted by system engineers, you may
want to make your language somewhat familiar to what people already
know.
 
> >>          regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
> >> -            .set_base((dma_start >> 40) as u16)
> >> +            .try_set_base(dma_start >> 40)?
> >>              .write(bar, &E::ID);
> >
> > Does it mean that something like the following syntax is possible?
> >
> >         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
> >             .try_set_base1(base1 >> 40)?        // fail here
> 
> Note that try_set_base1() returns a Result [1], which is handled immediately by
> the question mark operator [2]. I.e. if try_set_base1() returns an error it is
> propagated to the caller right away without executing any of the code below.

Thanks for the links. I am definitely the very beginning on the
learning curve for this.
 
> >             .try_set_base2(base2 >> 40)?        // skip
> >             .write(bar, &E::ID) else { pr_err!(); return -EINVAL };
> >
> > This is my main concern: Rust is advertised a as runtime-safe language
> > (at lease safer than C), but current design isn't safe against one of
> > the most common errors: type overflow.
> 
> Where do you see a potential runtime overflows in the register!() code?

Assuming base is 10-bit,
        
        let ret = some_c_wrapper()      // 0..1024 or -EINVAL
        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
             .try_set_base1(ret)

Or maybe I misunderstood the question, because if there's no possibility
to overflow a field, what for the .try_set_xxx() is needed at all?

> [1] https://rust.docs.kernel.org/kernel/error/type.Result.html
> [2] https://doc.rust-lang.org/reference/expressions/operator-expr.html?highlight=question%20mark#the-question-mark-operator
