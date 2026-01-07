Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46062CFF24F
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 18:38:18 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 24F5410E60D;
	Wed,  7 Jan 2026 17:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OXsMxiAP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3EE6544CA4;
	Wed,  7 Jan 2026 17:30:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767807001;
 b=mXra8zV9EawgzZQdHwURjSicmyqr/ZtNy2RMHw8DEjX10GxOKIP4trymZVVeocBm0Pr66
 h9t53hMzkBYsSumUyCxzuQWJXyNGe1iktPEs0H+GWN2O5CNaRfnJbhLep+mrBVhNlv2lUUR
 pm+iNngxYq8MmdcM0aNpOfJ18VD4WZraj/iT+BrscEIM+QEgByXCctxDskRGDWK8Z6bM3Il
 WGb3VmL5vYwp9vPVh/FtP3xOv9NhjKVREmqXIdbEwfuGZmxgiKz9gGwZVzGBHyf8nEPVZJa
 hVO6Zg295+cgKarmk9aMnpRzTeDlr9ctuIUywBzZn4K9TzzHLgzIQNuRJUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767807001; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dai0JxbhtkNUSVHfzCrnopP3eftyTSKVJDkB5Ag+2gU=;
 b=NnZWGlQ9N+bPD+UVW/0S1ygHL4ioYG0DNJ3stH/PZmlu/LWbRqYkL5YKRWYTTabMeE0og
 /CcIhzQ3Y1KOd4D+8X8WtXeFgkihzozKUPxlglc8b+ip48wCAUOaAyQnrWhMq8m6h4uM8zE
 bJkXhFWxHRbF9di2qyYIsDCVCZpOcgMOh6DlHB/oo8NNSMcrhuPU2TNwJPJVgWiS0letMC/
 6cLEp/6ggx1mHHbEtFXtP08QFb+AuO3R8S0muSLLMCe7Qs1znKAXoXT0yeEeNwnjGblrky1
 jijdLbjzs3ewMW8db2eYmH58wfZrV4W7cK2D0QKhV1X5Udw9r6n5/BSZJDog==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 424E744C9E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 17:29:58 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com
 [74.125.82.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DABA610E2B1
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 17:38:13 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-12055b489e0so181133c88.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 07 Jan 2026 09:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767807493; x=1768412293;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dai0JxbhtkNUSVHfzCrnopP3eftyTSKVJDkB5Ag+2gU=;
        b=OXsMxiAPrV5jV8twYl2d4+tv7HYwNn5Aq3nUCYWataOsL4mWTHUGwbGscxjqV60ZX3
         HtBTy3YKaVNBrld1MKsZugrj8uPbncuTUxYHgzY6+h7vKQMfP8eiJJHT6o1/wkIDGXno
         F27KF1sg43qbhAFtmf5szGXV2/5d09FsZZGQMx4kOWQITDfHTNd4bdD5sY1BLEitRm7Z
         Z6k+gLypxqjvFQwAUdPCkOdD0l4qUu0mp1XvnGGzK0C2CS7fPylGDaog5oeMTUhpDTKN
         M5dq16ivFb77vLNi59AH8rl0g3yB84NfpedX73VCiIGaCt+jTj6nZvG+F7MTALGm/l3d
         bV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767807493; x=1768412293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dai0JxbhtkNUSVHfzCrnopP3eftyTSKVJDkB5Ag+2gU=;
        b=Q5gUEcQDC8K7oSL8VMUenCSEEVykS0wTKeSUvX7G+ZwI4UczvDp8YwnHdlwSH5pD56
         JQEoqxd6c3CjsSG5nxWTxeS2WTMK2HQjTnRJFOMNVxuTBsOtBBL4KCKS9Z877iUxDjHs
         Ux4wxWNeSs+4H3IU/i7y8S8b05ISz1ot5gSwuwvBoXWT9KwkLbEppbsJiMXmRk/VYjnQ
         f9RDzD0J9+EZG7CKQtj7BbLrawkyVFNie8xHgQ8sG08BHRw32YVpPaV5iptdLEyA8QC3
         77CondALlv0iCFsUsc+9cSEUc3D8VRTu17Pr5RrACduflKNz7+apQ6eIHmRzLhZn37/o
         3jzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaxolNIvkIcXV0bqtFn78ypmyHVg7JEXX7dl4+xuL/v6Vyun3PPK5Q81EIBDT7QPybTDMMht7j@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy8Pl78hW3Sn0gtI5DJB9Ht6ofA+2GfrDOJNd8aQu/LwRbCCL0
	wJAIX70PNBXymQJlaZDUidKYTzFmL4H+evBXeeilDIqvqedqM+6VSvdufuIcF7VX4580iwqinCY
	5HJJ8HFBdTecPLg5Vj7l/83a622QmOXQ=
X-Gm-Gg: AY/fxX6IlHSJE0yq9X6ZmcunQpJv4otNrEP4opqDmEo2nyyE/W3ihVVZ5OE6ISiIHRD
	BdDA/wtSBl6VUNNIXWmV55PaQLwfaldTzuiPK+orOYV+onKD6jsCHEtpIkg3TA+N2gHKCK4jYdo
	96ZQCfesC/Dbok0bsiwoSTZT5CupP6wESAk1tA+TjBkkBK7Ddh5+gGVGtCdeAddrNgjhrsviBqM
	siLtitmQK9T6HMeiMg7Xp9GWEWqmujd32kRskpXAoOlVgxH/qwRAlCWMLj+VKNTtjbugjvGsRWE
	A5+vnc1hPns0p7By4QE2NX8xRC3xNZDIOAOJqLKoJRLLqCyyDkH44iPYQFFeYxEVfbHsofiPXOW
	Ww/12tQGNQ1Ui
X-Google-Smtp-Source: 
 AGHT+IGM3CJ6rtoXkbS1gqw0JneRH0rWCzxshK8igUVhgyP37LCW23SucegWV0VjMr/tA1v0YCguyHEB3GP0478A79I=
X-Received: by 2002:a05:7300:dd0c:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b17d30fd2fmr968807eec.5.1767807493047; Wed, 07 Jan 2026
 09:38:13 -0800 (PST)
MIME-Version: 1.0
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
 <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
 <CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com>
 <39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com>
 <20260107123159.7ac61d69@gandalf.local.home>
In-Reply-To: <20260107123159.7ac61d69@gandalf.local.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 18:38:00 +0100
X-Gm-Features: AQt7F2rwFEKJSdRzkzLSCri3PhwRCqQPNRRr6ZPmL34vxqGv6L7SqzXqvqSjVP8
Message-ID: 
 <CANiq72k6xengESGrJSELV8OtOwaO2d-DO0_to=WCu8PtfhH3mQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
To: Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BK7BOLDKA6ADPQ4IOGREFWVEKH7FVK7S
X-Message-ID-Hash: BK7BOLDKA6ADPQ4IOGREFWVEKH7FVK7S
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Fernandes <joel@joelfernandes.org>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, rust-for-linux <rust-for-linux@vger.kernel.org>,
 nouveau@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Paul E McKenney <paulmck@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 rostedt@google.com, Yury Norov <yury.norov@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BK7BOLDKA6ADPQ4IOGREFWVEKH7FVK7S/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72k6xengESGrJSELV8OtOwaO2d-DO0_to=WCu8PtfhH3mQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 7, 2026 at 6:31=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> This is why I prefer the "(company)" in the email name and not the addres=
s.
> It allows developers to maintain the same email while they move companies=
.
> I did this for Red Hat, VMware and now Google, and all with the same emai=
l
> address.

Yeah, it is simpler for everyone else, indeed.

> Although I may need to switch to my kernel.org address because my
> goodmis.org is being blocked by gmail :-p

I saw your post in LinkedIn about the pain... :)

But yeah, so far kernel.org is smooth (knocking on wood).

Cheers,
Miguel
