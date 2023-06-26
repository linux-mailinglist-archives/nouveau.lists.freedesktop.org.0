Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F573DB8F
	for <lists+nouveau@lfdr.de>; Mon, 26 Jun 2023 11:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141EA10E09A;
	Mon, 26 Jun 2023 09:39:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E2E10E09A
 for <nouveau@lists.freedesktop.org>; Mon, 26 Jun 2023 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687772372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KgNYGoDd82rrj7pNeRfXpxWK8j7mBNdGjTNkU3pMq4=;
 b=iYIysj89xmCtXfvcfUxlHUKSU2kKb9END+E3lUpUS1Xd08hldWkwDwMu5TIE0w8hUD2ng0
 PJ53zbwnRdaxCRagjInPtTo9bO2Kj9BwPPDyFLOzhgHv+8B/lanFec9aRXpLN7SwZF2+DC
 BGp3Gmt1VUiWHqfHPMw1bxNvdJoAcUs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-aBWVy-u6ODejZhhyBRvBtA-1; Mon, 26 Jun 2023 05:39:27 -0400
X-MC-Unique: aBWVy-u6ODejZhhyBRvBtA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2a7a6393ba6so4017151fa.1
 for <nouveau@lists.freedesktop.org>; Mon, 26 Jun 2023 02:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687772366; x=1690364366;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KgNYGoDd82rrj7pNeRfXpxWK8j7mBNdGjTNkU3pMq4=;
 b=jed7b+bjUzSMtSItCNjTzvZdXQZKn03vB7baCANDekOyF9TTN/UJpXPjSlbtPUrOPk
 m1X2KPsPSpctIKUjopAz6F2VcGoSvuqQyUSIXDRVm9+Z+5xQSkrxDH5e0EkgNMm5wMQ7
 jzDLHh4vc95JE+k6ZAYgt8nwdsXy9f9GdoFvggZoEoIJHQUwMQiKlY33gmMyQi36FX/4
 XeyflrHoIsPEnmQTJhdo0ml0oU0Q6ptphAcEQz1L02FUB8zlQcl3wVBg6ZPlguxSKanO
 rbWTGL6BhmgBiOlIYaqy2uSJ+h/rdmV/8yHCVJ9lCqyhw/eIEkO8H4Vk94vQhV4IfQeP
 1QAg==
X-Gm-Message-State: AC+VfDxvrWmPOBnPVa2lY4blFmP0IroOVvnDDz0ZfM7/Eld1jqPwMb4l
 9lepB/3xGTteZZDIYLOxvVxXnrzNiogwFVOXeMsoTxLWi5eFFLhyUkbvJo+W4+UN+6mpGFBCHqm
 GH9bEefgCJhYlDb9tyi4opfYfU9aojCbHbcNF6I9tVBImkAsYWg==
X-Received: by 2002:a2e:a487:0:b0:2b4:6d6a:2e18 with SMTP id
 h7-20020a2ea487000000b002b46d6a2e18mr13505469lji.4.1687772366178; 
 Mon, 26 Jun 2023 02:39:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vROmU3isJs+eMqO1mvEWrBJUNacV890fZP0Qy6b/PNaNeM2ua2qjaZ90eG2pGOjdonewxUzk5crUtmhzdd+k=
X-Received: by 2002:a2e:a487:0:b0:2b4:6d6a:2e18 with SMTP id
 h7-20020a2ea487000000b002b46d6a2e18mr13505464lji.4.1687772365885; Mon, 26 Jun
 2023 02:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <875y8dlep1.fsf@fin.soreny> <87o7l7i1t9.fsf@fin.soreny>
In-Reply-To: <87o7l7i1t9.fsf@fin.soreny>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 26 Jun 2023 11:39:14 +0200
Message-ID: <CACO55tua9PqFTVjU4yhN6DVvrMwSSuZOQ3nicaXDVS0uoDX_+Q@mail.gmail.com>
To: =?UTF-8?Q?Ferenc_W=C3=A1gner?= <wferi@niif.hu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] Powering down laptop GPU TU117GLM
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 12:12=E2=80=AFAM Ferenc W=C3=A1gner <wferi@niif.hu>=
 wrote:
>
> Ferenc W=C3=A1gner <wferi@niif.hu> writes:
>
> > Sorry if I'm reaching the wrong forum, please advise if so.  My questio=
n
> > is not about the main focus of this community, but I had no better idea
> > about where to look for the relevant expertise.
> >
> > So: this Dell Precision 5560 laptop is built with a "T1200 Laptop GPU",
> > and I suspect it draws power even though I don't ever use it, heating
> > the computer and shortening battery life.  Is there a way to shut it
> > down for good?  (Or to make sure it isn't causing my problems?)
>
> Looks like I chose the wrong forum after all.  Shall I try the linux-pm
> list instead, or can you recommend a more approriate one for the above
> question?
> --
> Thanks,
> Feri.
>

The GPU should be getting powered down automatically as long as
nouveau is loaded and nothing actively uses the GPU.

