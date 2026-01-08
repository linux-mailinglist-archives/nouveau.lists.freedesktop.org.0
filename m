Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10138D031AF
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 14:42:36 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 76B7E10E734;
	Thu,  8 Jan 2026 13:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0GhT/bfg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE73744C69;
	Thu,  8 Jan 2026 13:34:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767879256;
 b=zq9YoRQwlOFz8SWzCimioXpzg9bOObEClHMsCJzpHoF/RcW/zAZuJEAtWbvWqImvz3EG5
 kfViDlzaa/iOorvd7s6/Z1g7nZkq4au+z4dWS5TuJmi0paxVYO4cimnhCHZE3rpggcdKL/y
 4QqAtg4euqSPNcKd+WlRzF7xmynel87v3Dun586iZaxqzHT7MfnELK6hEFOFrz2khY1R71O
 ZhJvRv08+iBPNfEHsW/yza6/twgIhInf4IREJdQLG0scHM26VtONAQ85vF4kUhsVwb5Jkgl
 b0iW1ZAIqSmQlNPVuWxjvtRXUt/wsmBohtiAx8Eigvx710WZk0zpXFh711Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767879256; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DuB8LeaUuU12NZRvbDwmqGr7VISKQiEng/u87ABnUmg=;
 b=h4geOutdzISTcTjFvG4+2YO2q17j0hm9tZRu/CqlDZq3tu1X6BjbQfDE7QCYDgIt+gO/g
 oPz7eAA1IXAv+T/SP+Q04ffIdoyXxxqFGQQVmqVaLuo3CedUPKchVNU2ZHnWt2FGicECgK6
 Dr7DImDcJHKSDULBYfubWVJ8/8YVPR7NHXYP44NJUEppoCxf5NwPmjvqXs+NePkQ7u/gcxv
 qm8WeFrY8i4lpCEO3d7KsSQ7PTueIeH2Bdbs2pR9P2vbTBic9Zd8z8uAgewR6O3uSewUHj4
 j6KLimBr6NlDMGJCTrTLZUpTEft66Xz+ReNNsM/ilcxrwWHgJFwhItfgF4Ag==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 081AD43AF7
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 13:34:14 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B28F10E729
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 13:42:31 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-431048c4068so1165396f8f.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 08 Jan 2026 05:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767879750; x=1768484550;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuB8LeaUuU12NZRvbDwmqGr7VISKQiEng/u87ABnUmg=;
        b=0GhT/bfgYlTXv9Ox2E59DMG1zipNvZ66PyB62FMqTJzXq/8F29fKZl7spli1rA7Flh
         himP/VTHIZHLYnCsXLvXW023NFV5eZ2HEHLohIauyQa+4Rm1TZGTjDNw4wKdUBPTgBvc
         U5OhpbIU/FKMO/pYNzcUFg3OVawAReKG+oiEZl5h0NWOuy/Z7wvzfvnlLw5tQ50M56qx
         pz1apBJxN4/efXxvsc84cP07HrvV/+s7X98NvWeiI8cWXVC6RAZSskZDOXDp/06GziFN
         Q2bDrKSluCnrXllCokWa595ueDC7h/UA+MxrbBkcj3kp6YH8mUvVI2N+kfL+wEuVdUZt
         fSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879750; x=1768484550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuB8LeaUuU12NZRvbDwmqGr7VISKQiEng/u87ABnUmg=;
        b=Dk4OcljJCVCZ6tga+pqxG7hI6Lg1tdOE3bmbYfM6jhET4hoKjkxWMGrcvax7PDYnga
         9T4w47QtJf4mvxAaZfuAvrBOIHzTVdjH06UbdNwx/4Sd+HYcR+J2tDYyrYagelumt3Bs
         5awu2vDTX3juecpo2SYFTSbx8IYcJHG+kUwWS7ZHK9Xzv07vnYKiv55OkUnwX6ai4VOm
         HArNfojXST0ypTwi7KEH28Vwd61Lvx+b2uTxG5nKpt9ESF9DZ76woRTkVLBoBh8mQD37
         rzyxbm9Pf1dzKILJUFhhFqohGP6h8PBY1QLVTIzZ48rBzYjEa3hAuZPhHx7yasU8Ola8
         l8EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzGuvD+TYrPxVt/K2/msZkKyjUUbNwXr4E2W5WCrat55sZnYIKIlEueNrpauiu7AJUhed/VDm0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj5ESqMnf5QgK4bPU2IL/1tpNYUIq4ne88RZ1DnkRa02Zcauww
	ON0sAaBZTDGB/bkmowK71AIBEzG3dfjQsDdh/ztvXihKJBpW2n9ruVh/K0sEGjP757H2oso+ABA
	7qK8vQ+ylCGWnjM4SjId2uX4UM4M4Ip+s+eRRQySs
X-Gm-Gg: AY/fxX46Cy7sNZJu7eqqJL1Zrr+wTldHlRxadtsCHRg1ADMVdgzs8h8AInNU5cU/1ZN
	dQSCwX74z3/CiBAgCNWDY7orMekRL/XpkdrRxW5N3XI2WkUGr2vl5NXkNoVW3dmXg7lEprS0g3n
	/8yIyVZg4cJCir/40qJctrQHgqcxUxCpe6X3+/0q5gq0GwcbFgssEfeQ9UOlzZL8KAhbC9GPKx0
	GADOb+qvbmsaI2pkFzm9LCzDgkZrji8sICBeBQV9gdRfi5bIGmZt8BT2YHrDCrQv4/P7nFMWFMJ
	5ZGQ0+XW3YzxZ/SUJxA31W4bxPYjDs0ZuDgCCYGkZK7A+piRgQQ6Yn5VsQ==
X-Google-Smtp-Source: 
 AGHT+IExWOEkyCLKUgDRVthn2SZknPs0kVAfglSywEbSBNIbCWLLC6QfR3LyA9uswU60dLniHiZXbHB2t4WQ0/bzApM=
X-Received: by 2002:a05:6000:238a:b0:432:c17c:3094 with SMTP id
 ffacd0b85a97d-432c17c349emr9810039f8f.3.1767879749526; Thu, 08 Jan 2026
 05:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20260107012414.2429246-1-ttabi@nvidia.com>
 <20260107012414.2429246-2-ttabi@nvidia.com>
 <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
 <CANiq72mKUxGh8cdZW0fXPCg20zoL19HY0GxRSDSYCj68Mp04vw@mail.gmail.com>
 <20260108125523.5c7810ae.gary@garyguo.net>
 <DFJ8XRR2T22T.3R4FQHF50B4P4@kernel.org>
In-Reply-To: <DFJ8XRR2T22T.3R4FQHF50B4P4@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Jan 2026 14:42:17 +0100
X-Gm-Features: AQt7F2rpElxPKiqi8TNKEVozc5izmbhmGdSTR-9ZUc-Fg8J90AnYRHvNjmoDqyw
Message-ID: 
 <CAH5fLgjjAO6n4EvWT-Q4+GmhL9v-gFw1PTzss5Ni3jWdNXqKmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several print
 strings
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YRRL6UM7B57OLGDRRYSDKIPM7BVP7YX5
X-Message-ID-Hash: YRRL6UM7B57OLGDRRYSDKIPM7BVP7YX5
X-MailFrom: aliceryhl@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YRRL6UM7B57OLGDRRYSDKIPM7BVP7YX5/>
Archived-At: 
 <https://lore.freedesktop.org/CAH5fLgjjAO6n4EvWT-Q4+GmhL9v-gFw1PTzss5Ni3jWdNXqKmA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jan 8, 2026 at 2:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> (Cc: Greg, Rafael)
>
> On Thu Jan 8, 2026 at 1:55 PM CET, Gary Guo wrote:
> > In very early days (before RfL is upstreamed), I had a prototype print
> > macro that is designed like this:
> >
> >       info!("foo"); // pr_info("foo\n");
> >       info!(target: dev, "foo"); // dev_info(dev, "foo\n");
> >       info!(target: dev, once, "foo"); // dev_info_once(dev, "foo\n");
> >       info!(target: dev, ratelimited, "foo"); // dev_info_ratelimited(d=
ev, "foo\n");
> >
> > There's a trait that is implemented for anything that can be used as a
> > printing target.
> >
> > I still think this is superior than just having our macro mimicking the=
 C
> > side (and as a result, having a lot of macros rather than just one for
> > each level).
>
> Why do you think this syntax is superior?
>
> One disadvantage for maintainers and reviewers would be that it is less
> convinient to grep for pr_*() vs dev_*(), which is something that people
> regularly get wrong. I.e. it regularly happens that people use pr_*() whe=
re they
> actually print in the context of a specific device.
>
> > I think with Rust printing machinary, `pr_cont` is rarely useful, inste=
ad
> > of calling `pr_info` followed by multiple `pr_cont`, you can just have =
a
> > custom `Display` implementation and print it in one go. This is also fr=
ee
> > from racing against another print and have your lines broken into two
> > parts.
>
> This I fully agree with.
>
> > I would be much in favour of vouching deleteing `pr_cont` entirely from
> > Rust codebase and always have newlines automatically added.
>
> I don't think it is a good idea to always add newlines. It might be fine =
if you
> only do C code or only do Rust code, but if you are switching back and fo=
rth, it
> is a horrible inconsistency for muscle memory.
>
> I'm pretty sure that this would turn into a generator for trivial fixup p=
atches
> either removing or adding the trailing '\n'. :)

What about triggering a build failure if you forget the newline?

For cases where the \n is intentionally omitted for use with pr_cont!,
we can add separate syntax for making this explicit:

pr_info!("hello! thi", cont);
pr_cont!("s tring is split\n");

This way, you can't forget the newline, but you can still omit it if
you really want to use pr_cont.

Alice
