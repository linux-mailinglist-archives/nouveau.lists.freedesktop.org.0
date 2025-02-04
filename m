Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B98CBADC1
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5703010EB0B;
	Sat, 13 Dec 2025 12:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="rUMyxT+k";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B3E10E098
 for <nouveau@lists.freedesktop.org>; Tue,  4 Feb 2025 21:09:25 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so70097095e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 04 Feb 2025 13:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1738703364; x=1739308164;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hU4QrAbDQR1o2bnoBznVmRjsUjgFoPERHNCe0D3R9dg=;
 b=rUMyxT+k+8xP2lzhRtjpJjDyTTP3wWYyNRGZPrEgvLqX5M+fsD/FX/+P8/+yStYCQR
 CaIuRW6liKNA94dEyP0JfyB/U3+vGRjf9CFMCfHSY8sDFc3aqcN/0uq73DCClreCs6b0
 rpoQ8BZrhVt4ox70oDKBRmHugq8o1NtNQ4+sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738703364; x=1739308164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hU4QrAbDQR1o2bnoBznVmRjsUjgFoPERHNCe0D3R9dg=;
 b=ff48uYlnNQmpKWJYRWKHaZ0qu3N8EH7XdyZOyt/bJDNrIVuwb+yUjfbIpmfOruMZJc
 j6jEPv144qyH2k7EKdKzZpyETt4EMI5e/wdSrnFKUsPTaH6KUYww/CsiPLMTq8/hcNvy
 JixmdZ3xDL/Yw8qgixJvMAY2QB4cOHbCXOidTEeGs5DF1gHF1Z3daDz5r5o9N/vnkxzS
 LEgxSe7fHoeLRPiDnPH5lYY6fU/YobgXMkMKt6tnafkyAUaOJ9psFvkKn+gUK/uycN4J
 4ZwKg2L+5/6KVcnninGAt172PoRbn8Nwt1TF6YJthElBhNSZHA+JNJ4twkD+H3OYcg1Y
 KFkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKX/OGYejVRL93f1Xj9lvLW9XssSjJuILqZpz9YS+QdFVQwxi/j1Ucd7ro44pC0/ui+EoTmlWx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvphzlyWbEg1xkeUhj1R8YDnS1ozSxzvcSn7BvgqqcInr9VTmP
 KGeXU9kjcDPebvgWAu0aIP4fIMNrQIWZAGlzhXD4FE8T327tzejxMiDg0mvMit4a/6++9GlILyW
 dHJ4NkqRlY6evdwZ5rTPdpSpvrWQlgqvFxSq4IQ==
X-Gm-Gg: ASbGncuzltCuA5p/n5dB+c9yxOCeHa7/YMcKZ9KcWX++HgG7n8XB8HEgIHVAKrw36f9
 VRzJf9pd1rDxJqeQelIxjtZXAM6uPIgTnZPDQEpDi1AqcKVdi/K4Vj2lG6uOd04xayqlHh+wF
X-Google-Smtp-Source: AGHT+IG1wU/phrvdmWOZ6gg4Qkaj9tiLGHlTlII39K2KsIGA/7PJCQGdfM9Y7R/VJVyH/LBFDX1pLGfA1F+6yTJrKno=
X-Received: by 2002:a05:600c:5492:b0:434:ff25:19a0 with SMTP id
 5b1f17b1804b1-4390d5697b4mr753735e9.21.1738703363904; Tue, 04 Feb 2025
 13:09:23 -0800 (PST)
MIME-Version: 1.0
References: <20250131220432.17717-1-dakr@kernel.org>
 <20250203202410.GA3936980@joelbox2> <Z6Jgf-cVt_AlM6Qd@cassiopeiae>
In-Reply-To: <Z6Jgf-cVt_AlM6Qd@cassiopeiae>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 4 Feb 2025 16:09:13 -0500
X-Gm-Features: AWEUYZmCOUkLm9MpjL2MDd5EZQ1gMNJEykz-KDiUu51t6tTmXr73ZDfIU09FM3Q
Message-ID: <CAEXW_YQQey_QweH+favrXPhrEkVwyqCXRG+UBn-oG6wb+n4+gA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, 
 cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, 
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, joelagnelf@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:52 +0000
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

On Tue, Feb 4, 2025 at 1:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon, Feb 03, 2025 at 03:24:10PM -0500, Joel Fernandes wrote:
> > Hi Danilo,
> >
> > On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> > > +#[pin_data]
> > > +pub(crate) struct NovaCore {
> > > +    #[pin]
> > > +    pub(crate) gpu: Gpu,
> > > +}
> >
> > I am curious what is the need for pinning here in the patch in its curr=
ent
> > form, is it for future-proofing?
>
> Yes, it is.
>
> It's not always needed, but since I know that further down the road we'll=
 need
> at least a few mutexes, it seemed reasonable to already consider it.

It seems reasonable to me as well, I would probably also add a code
comment there about what is expected to be unmovable in the future
(Just in case any code readers don't raise the same question I was
raising).

The source of the confusion for a reader could be the documentation
expecting a #[pin].

 - Joel
