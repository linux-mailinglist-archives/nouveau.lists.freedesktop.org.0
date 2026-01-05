Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A65CF431D
	for <lists+nouveau@lfdr.de>; Mon, 05 Jan 2026 15:43:02 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EEC4D10E41C;
	Mon,  5 Jan 2026 14:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tqZuT1CF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CBB2744C99;
	Mon,  5 Jan 2026 14:34:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767623689;
 b=J2ArE363+F65JI9kF4b+FR3NFGJrWaGqm6Up1Aje4+1GWCDMdtZ+5xwUh40dx9jlP1kj7
 6Om+f33hLtIqrxpuFGWYmzOS8sLYnZWMdgC3FqEczo3yJ5fY0mQICrk++IjDYuw2Gk+trum
 ROPc2V5gJltYHk6YiEvTMuZeyLU7zXz0NpiUiBTosvyM2cNWIBueGgJzllJH2uav3FWRx8V
 48+0q+H9845KlGmWdwqVo5CRlzFiQj3LsnC5xsb4aX0GFPpzReLpZdVZXt1lF1FEx7kPz0Q
 TDUL+B9/FwrZN3OK0JV/9ELulCKii8yeJ1cAWpVmdc4oxWyE98dp7UhkSh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767623689; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IXdf0LXlC7LLmtOw3gD/Pm84JhncF0jbKrKJRTeRT5Q=;
 b=SmvJ2Lo/HGUlnqBUr4DxsTGNLzwZKcFE6LqIiSxWJV0TyjQrIMBgZDStKNbPeceEB18v7
 ixdqJTxsY137Hu4dm/Ican3UFtlMKIi5W6eJF9dZd/65wiagWACDLqqDXjwWIQvDODdTIRh
 vlN74xPYRkfh7aZhaVeJVYt3mYR8cr+14vIdP/8toZMyIok4kEEAJpzesehKufMGvRMhviq
 po7kgo+iFekkm6NhcgLc4lE6MfEGwasCw4tTc62s0qEKCuJPTOcVy4a5RB24Wm3aBSSDUeb
 /EQ6Aw/gJTe5kjYJ+qgGxSGISG9MF4uj8rulyvKsGaMTOQp79L0vchVHx3uQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 175E4404B1
	for <nouveau@lists.freedesktop.org>; Mon,  5 Jan 2026 14:34:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E4D5910E284;
	Mon,  5 Jan 2026 14:42:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C59860010;
	Mon,  5 Jan 2026 14:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D77C116D0;
	Mon,  5 Jan 2026 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767624175;
	bh=6+8f2BT3Z4bZnc2ROvMYTb+LPX7mFTDLfErvycYF72o=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=tqZuT1CFfHbPqkdofgWoAvVTM9Y9mwz2Manjn2sjc5klHUPgD5zKtW9tepNdXObTE
	 lj5zcF5jCiAY/gFx+xhfP4EfRXuo8tYtKXcYtKr0aOx+zh9LPGRtyeJ5mdC0JEpWz+
	 OnO4sXQINU+07aXMSjgNxUGDU/yfqxNLMlWwPLcSUPhqGp5QTOa70m6yfyU1FgB5V3
	 KXminCeHSMOsPzTS8IHAqbTDk4lZ2fnffQXsWLhCpmfmedeywpDSIiJRbIM92aBPf9
	 7EMb+2QjfFZ7HpifIJIOAR+aDgiZpQsB3yWCxvnpRGmcFZI4YPm9OjhxKK07LKMglq
	 CWICg+IlM1R4g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 15:42:50 +0100
Message-Id: <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
In-Reply-To: <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
Message-ID-Hash: KO2TD5SU46IJEDE5NBKT2WRZX4Y63CS4
X-Message-ID-Hash: KO2TD5SU46IJEDE5NBKT2WRZX4Y63CS4
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Maurice Hieronymus <mhi@mailbox.org>, aliceryhl@google.com,
 acourbot@nvidia.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KO2TD5SU46IJEDE5NBKT2WRZX4Y63CS4/>
Archived-At: 
 <https://lore.freedesktop.org/DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jan 5, 2026 at 11:29 AM CET, Danilo Krummrich wrote:
> On Mon Jan 5, 2026 at 10:02 AM CET, Benno Lossin wrote:
>> On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:
>>> Add a derive macro that implements kernel::fmt::Display for enums.
>>> The macro outputs the exact variant name as written, preserving case.
>>>
>>> This supports all enum variant types: unit, tuple, and struct variants.
>>> For variants with data, only the variant name is displayed.
>>
>> I don't think we should be adding this. Display is designed for
>> user-facing output and so it should always be carefully designed and no
>> automation should exist for it.
>
> In general I agree, but simple stringification of an enum variant for a D=
isplay
> implementation is a very common use-case and it seems pretty unfortunate =
to have
> to fall back to either do the below (especially if there are a lot of enu=
m
> variants) or having to go the declarative path of doing something as in [=
1].
>
> Especially in combination with things like FromPrimitive and ToPrimitive =
it gets
> us rid of the cases where we need such declarative macro mess.
>
> Eventually, drivers will most likely implement their own proc macro for t=
his or
> repeat the declarative macro pattern over and over again.

When the definition already uses declarative macros, adding the Display
impl there is the correct way to do it IMO. If it is just a normal
definition, then a match is annoying when you have many variants.

> Maybe we should just pick a more specific name for such a derive macro th=
an
> macros::Display.
>
> Maybe something along the lines of macros::EnumVariantDisplay? We could a=
lso
> have an optional argument indicating whether it should be converted to lo=
wer /
> upper case.

I'm still skeptical about having a derive macro for `Display`. What
about adding & deriving the following trait instead:

    pub trait EnumVariantName {
        fn variant_name(&self) -> &'static str;
    }

To print this, you of course need to call the function, but it is much
more self-descriptive than printing the `Chipset` directly.

Cheers,
Benno
