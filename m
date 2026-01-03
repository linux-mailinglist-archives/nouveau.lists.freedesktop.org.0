Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D376CEFE40
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 11:44:23 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8170B10E33D;
	Sat,  3 Jan 2026 10:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="fG6uFlDz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 394E044C85;
	Sat,  3 Jan 2026 10:36:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767436575;
 b=JSOLU2A0UjY5iladT6IAqWc/g48O+xrskVLdMIiyOqHkL2Z7XjC4nD2wfCIrhwycVcS49
 kVK4RYSkPCksOvMJeEfcE01zXhLEF+E77bd8U7FXGni0CyKOKXuSc21WOz7uoOPmgatJH/x
 m1UFnx7LgcUT6i+DfjrDltpcYP29sx2LAv6CijTdMIH5SsS4IjMuLwsJ7Wd0E3YmnDgQgho
 KzjAOSHf2/K+M6R2jqOXqU9ac3Lb6ozzMo+8KL4bqjxMPKiaOz04n+qeBz7Od+1oYtlwVM2
 r2Ecy+MCXvl3WX6XOTTavnwHGOOWnGBs0RLlA2J0b/9eXlLQaVgFK2uEA/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767436575; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Q490h70nD1q9mLKhZrcgkHWBp8ifCWlFiPf83Y6LE9o=;
 b=A07x3I4nASm68VWisst9dO1xpjaWIfDfSZcu3/PHfW8Q7DMztPe9HGWKywriljux60rti
 LEpiEf+OT32g5E952kNunLgp//+8NzFRBn5cBb8VX13GfkdhHRLm3eyV3TKUOyyrYZ9rRHr
 mdwxTmFqFdKJlGLveFXFb0UI4gStGqaZ9fBsxC3Ow9Mr3UvkrIVU0bS9bU8JwsgsaryZlnU
 +SU11N0VVwPACWS3P/3i9jwYMklQdbI6rCLVvCzHnozSbVD6fUqygmHKcOxa1GDbYPVGJ9U
 rDCP1B8zUjZUOn7T9VM3rMwQ1hNDwlhfhQ12GRXR46tPZJnhvxTbZiG/RSdw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 414A344C4F
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 10:36:12 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CEFEC10E098;
	Sat,  3 Jan 2026 10:44:16 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4djxy54Y1bz9v6q;
	Sat,  3 Jan 2026 11:44:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767437053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q490h70nD1q9mLKhZrcgkHWBp8ifCWlFiPf83Y6LE9o=;
	b=fG6uFlDzocisagfyyAB0++nE5/QjrSCGtrUY/4snWl01tEjYQbzp5OCldcmUhS6ZzrULuS
	+BU6AvO6OpNWl58oKTFr505vxeprxzi2YLA9iT6OJ05ICk/kNvX2+RfgnnxP0dIhQMDtyd
	nFlJUn4CKrHwIyPBYEAqj/6YwA86HFbVnx0gqoWEwG53WQDIekjJ3igH6NAJk/1P2z3By9
	Ie6sJiGKiU50msFt1OQXn+trHJBE7HcT0GBviV+5UAP52Wvc+QQkPlAiRNDgiI20tib1mA
	b1wFGw4KLaRVfbnJQdRG18eE8EivbCyPyBgZu0yngbBK1ZtosIgQgN05Qg6iVg==
Message-ID: <fdaf272295d90d2d051d4997a99ee899c45d7b67.camel@mailbox.org>
Subject: Re: [PATCH] gpu: nova-core: use stable name() method in Chipset
 Display impl
From: Maurice Hieronymus <mhi@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>
Date: Sat, 03 Jan 2026 11:44:09 +0100
In-Reply-To: <DFEV1P747QKG.3O75MCC6HFYK4@kernel.org>
References: <20260101184137.80445-1-mhi@mailbox.org>
	 <DFEV1P747QKG.3O75MCC6HFYK4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 5c8225c05414e845f56
X-MBO-RS-META: ms4ecxrcrreiq778guup4eppkrfkzd5b
Message-ID-Hash: KSN4MYDGCNA4QPTFWWRVBCPWT5BAP2VD
X-Message-ID-Hash: KSN4MYDGCNA4QPTFWWRVBCPWT5BAP2VD
X-MailFrom: mhi@mailbox.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KSN4MYDGCNA4QPTFWWRVBCPWT5BAP2VD/>
Archived-At: 
 <https://lore.freedesktop.org/fdaf272295d90d2d051d4997a99ee899c45d7b67.camel@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 2026-01-03 at 10:52 +0100, Danilo Krummrich wrote:
> On Thu Jan 1, 2026 at 7:41 PM CET, Maurice Hieronymus wrote:
> > Chipset's Display was using Debug formatting ("{self:?}"), which is
> > not
> > guaranteed to be stable. Use the existing name() method instead,
> > which
> > provides stable lowercase strings suitable for firmware path
> > generation.
> >=20
> > Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
> > ---
> > =C2=A0drivers/gpu/nova-core/gpu.rs | 10 +---------
> > =C2=A01 file changed, 1 insertion(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-
> > core/gpu.rs
> > index 629c9d2dc994..be8c882338ea 100644
> > --- a/drivers/gpu/nova-core/gpu.rs
> > +++ b/drivers/gpu/nova-core/gpu.rs
> > @@ -107,17 +107,9 @@ pub(crate) fn arch(&self) -> Architecture {
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
> > =C2=A0
> > -// TODO
> > -//
> > -// The resulting strings are used to generate firmware paths,
> > hence the
> > -// generated strings have to be stable.
> > -//
> > -// Hence, replace with something like strum_macros
> > derive(Display).
> > -//
> > -// For now, redirect to fmt::Debug for convenience.
> > =C2=A0impl fmt::Display for Chipset {
> > =C2=A0=C2=A0=C2=A0=C2=A0 fn fmt(&self, f: &mut fmt::Formatter<'_>) -> f=
mt::Result {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write!(f, "{self:?}")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write!(f, "{}", self.name()=
)
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
>=20
> This also converts the printed string to lowercase. While this is not
> that big a
> deal, the solution we are looking for instead is what the TODO
> comment says: be
> able to derive a Display implementation (for enums).
>=20
> Now that we have syn in the kernel, this seems quite straight forward
> to
> implement. Are you interested in working on this instead?
>=20
Definitely!

The Display implementation should print the enum value as it is,
without changing the case, correct?

I will have a look into that and send a new patch set in the next few
days.

> Thanks,
> Danilo
