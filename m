Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47FBD3BA53
	for <lists+nouveau@lfdr.de>; Mon, 19 Jan 2026 23:02:54 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0560E10E540;
	Mon, 19 Jan 2026 22:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JaiO80NH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 05E6F44CA1;
	Mon, 19 Jan 2026 21:54:09 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768859648;
 b=NlPyU/CH8hwzIiohcZzyGxLF57LZPbmz5fyvHiagq1W4y30KZ0WGQC8XwcTnnmgLkeBmz
 MC6/axw8vVzfCKkKRnGhDZYi3Wv4GXzysUtf0zt29A9tsb2p4nIcDK2E6/TsTWqiKjCryuf
 rap+0ksXRiVhDpwNJMlMtJlJ1/16N4UBypK5glDXNn1YhG8+qdPcdX2cjQ2TVSeKLE5G1n1
 f2kiFWTaE9f0ZwnkcooXtaoSlVAHfTqldnag/21WTHFm5CO2pVykA6eRr3CB2qusKSoCv/C
 Z4wpmIbbUrQKqflz+AP/eARn3K0Z3KCCZ13pE/unyn7Th8YrnoxbbnyBuuEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768859648; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z4I1FG5kE92RzhWR3jE/PRvJseV6D1MVfRbu162Q0DE=;
 b=0+DViHWRroOmmknGZnHzPz2GwDJe77OKVEyAv0q2CbfNaPswqgSHZAsUmoINDc8qMYGHX
 y6+2gDUqrB3q+ODm0YGV7gYnk9TXS6I7UBZLVzFZX/2A4r/VUpWpMQc+ukPjqrmHvQiPYXC
 p5eL84ogolGn1cM88L+wfBmAmviVNF93dfh8iuGM3LQukmtYmyLG29uqkuor0+NVGin6XMC
 XDZDOVlPRBQ7mt9GNHgHQ13ZANZZxeuQXIA/1qmxwfghuyuE7WuxsAwPn7RP3ubj1IFbgYs
 IRIUgQ2c4/AioMVsxnwWmUBH2bJjERjaAJIZUYTqqmgRpu1Cpth+0hhUWwmA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 00B9A404B2
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 21:54:06 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8E59710E530
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 22:02:48 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-8887f43b224so90725566d6.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 19 Jan 2026 14:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768860167; cv=none;
        d=google.com; s=arc-20240605;
        b=kVCm+TUO/vUejWQcuuNqqQe2RVnDvZ9Wr/P1pjlc4AK0xFHeMYL3y3I8S1Ssrrtn2v
         gV7j4RU0CUu65rDMz6nMbA+Vqal7X47MRjE9gP6826IsYWyz2RPLSftdJ7tvEc7Zt2gt
         4qjgpEjMo5CuP7FxrUb6ol9KrTKktVgysPkIsFnWmMes77qccha3IHADTYy1t3KTHVgb
         g9MnPC/zTOfkeJV0rlMidMRbIzXMuGigqOGHF8Okhrgsz54tzdCM1KBvTowi49mzBy8j
         FsOfGfITrdhiRdS10os2drIMF0gpvu+jWTCynMFbbHXkXTKXU4vMLxoAsTxxWW8L8S4E
         wEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z4I1FG5kE92RzhWR3jE/PRvJseV6D1MVfRbu162Q0DE=;
        fh=uCGwTmppUAxFfKRqPunspAA90xBV598KzERUBdXdOYw=;
        b=HpdxZbO2iZzDglSIfOCrh2bsHOuRWOS9lryH8mILjTEgTyo6jzajPcEzvRl3pGAuUi
         gbAP4l0Ci9WfrhaVkSuDwQ+zfpkjShw4lKXcZHbBURSn+HMIYq6QgVZCjHX91wY0Ipnr
         lnThZtiS93TyHGd/YpkdVxI/Vo/M+in/nupI6k1D8CKc8IJ3e+khOPyWFoWX5Yawhc2e
         sIoNmiS6cwd+zXxbaqvbwDRksGJV6/H8xHQix39FOXh+yZMnt/FXWQyC9fs9Njns+iAJ
         AfQDbP3w7z/KaFLYyB32bsXsW+o468fFXCnHfLTZ3q/bxpDF10CFtPDBQWDRJCszSojb
         ug2A==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768860167; x=1769464967;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z4I1FG5kE92RzhWR3jE/PRvJseV6D1MVfRbu162Q0DE=;
        b=JaiO80NHhoewjHl+Etdk07MN7qLw9H6Lm/i9KlFCVQNe6HNIccH3Olxt1E5tuHYWiq
         rI3iG/2U6d3OLrktLGXSufbhNjah8lCGphcrSwPrMumRaSFIxZR8t+gy2sXqe/bZhLmW
         cLK8b3H/ZLr8SA5ZznhytvTgrE6YucTxzepxtq8GyVq5rvworKxPV5x6SUipUbhaCRpJ
         vNURQPUWAjyzt5WoLZMJ3w0tFsEWSYpqCtY628KIf7cFmOAKofr/S7IE/+s6qnJJrm4y
         9lSHxfOFWxguWDUXUKdts76ff2K+SclHd5PHLtv4kJqsjlYZJWsz/o6xjAbvaEyPt+xB
         Vj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768860167; x=1769464967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4I1FG5kE92RzhWR3jE/PRvJseV6D1MVfRbu162Q0DE=;
        b=cbgavEZoY4YBsozjerOHS65n6Ynwf61HrY6PwCgCxibKHvMJo7zxdk8NhVEhm5ob7z
         gnfBn+Yg6HXHIIE4srrqSWwsw+f6vEjtBnJ9UkKGyVFCD73ZitNNY3JHdf6JGYprKpI+
         Rj/bgcXAwvC3PqIHWaJPV91IDLP05HBAj6hUK4WMuPMhyzW0d0kJp8WgtQ44G2sgqonb
         i27gHq5HMNrGknpm4Vsu7EdjIepb67B6Epfw3RrHVuFUgX9BvKIzTpq0djvskgaEwOHY
         4abtI39yi6Wf35wnf4+dcrWZMQaLW2OvniHdP+o8LQGlnNgb8sj3qKA7R+vW2FSSqZJV
         3ezA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0Txo/gC6vXAwu4h1zbsK9t6EJKlCzuAgrMuJ4eVuFoKUcGwzwJZeqMgwdJGMrHkhi6dbjoI1y@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsAW4AEvwbkrwZxY7b+2HypuLv/WfNEv2kfr81MVPDRw/Zt8Tw
	ygQdTLMCQq0CSXFf6MWSg18PPxrylXwYQeMPY0fh5LXVjS3aObemrMJoFWuR8ppF+dcWIinETFb
	XqVU63QGG7ALoTeW/PzNCd+j3C0CVelY=
X-Gm-Gg: AZuq6aKWZBW+Bx+ZhFbSHs3AF1AiSsUCCRsIVSsQ2YDwNkzBwwlNwyMuIMXYMTsYAnI
	mUTRvJqlQkpEcmJ6uWCtznhH832R7U1Zy8m3v47rRQs0DBpZLFHuP0NbbwQYRU3zutZk2i74AK0
	tdM9BuzieUYpvtULXd/D20viNF7duksA2CH8tSMB4M2JeY8cb2UVXmIfrhfudjXSnAsBsrQTlmH
	dQ4jLdqQAlF17ttkQbqOOAa0ppLJbk03Imnbl4vau48L5CCA5kiCb8K8IQxmGEQ7vEfv1I3oUfY
	8gET1G5oCm2WzadYcBoH3VfzKPnW9DSjSoDE0CSK90YfiwIcZ6pb8dU=
X-Received: by 2002:a05:6214:d64:b0:88a:42b1:25e7 with SMTP id
 6a1803df08f44-8942e2e7e18mr209340696d6.29.1768860167408; Mon, 19 Jan 2026
 14:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20260119053701.181329-1-airlied@gmail.com>
 <5b6715f8f096ee6ea180b6d12e56bdee590c1d7a.camel@nvidia.com>
In-Reply-To: <5b6715f8f096ee6ea180b6d12e56bdee590c1d7a.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 Jan 2026 08:02:36 +1000
X-Gm-Features: AZwV_QhCVe8QaDvRC3eoJ6O0Y0glZm6tgMDDwzHo_FWvXkNE4w01slqV06UIAWE
Message-ID: 
 <CAPM=9twAOoshrw5vUo_ErwZwkg1ZQPMoS8nBfgcJU97BFMGmQw@mail.gmail.com>
Subject: Re: [PATCH] nouveau/gsp: use rpc sequence numbers properly.
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: MILYYDBW2OJJYN3ARV4YLSV3UZMJRZJ4
X-Message-ID-Hash: MILYYDBW2OJJYN3ARV4YLSV3UZMJRZJ4
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MILYYDBW2OJJYN3ARV4YLSV3UZMJRZJ4/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9twAOoshrw5vUo_ErwZwkg1ZQPMoS8nBfgcJU97BFMGmQw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 20 Jan 2026 at 04:57, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Mon, 2026-01-19 at 15:37 +1000, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > There are two layers of sequence numbers, one at the msg level
> > and one at the rpc level.
> >
> > 570 firmware started asserting on the sequence numbers being
> > in the right order, and we would see nocat records with asserts
> > in them.
>
> I wonder if this is why I see so many NOCAT records when booting GSP-RM in Nova.

Very likely, nova should probably get support for the rpc seq numbers.

Dave.
