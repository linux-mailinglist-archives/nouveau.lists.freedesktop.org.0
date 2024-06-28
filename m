Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3F091C665
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2024 21:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0899F10E22C;
	Fri, 28 Jun 2024 19:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BIPheEa3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45DC10E084
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2024 19:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719601757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQbiTv/VM0FHRwk2XTT1cLcVoQXr0OCJr39ObtijekU=;
 b=BIPheEa32VmgEWJm8SJGniJj1LoKZXuxq8zu0eze2YrlxS9YtXueitwJmDHHLlSp+fUnzU
 kfgD6XnvupGbYMwaT0U8JB/gMp7TcMyl/KhFLvuhnzzNJVVOmBPOMebYqHwuSLeZOJq8+U
 BxJ5ee7omH1tMQnD4EoPq8tq6R4pxrw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-gHvoAjTCNbmakWTrnQwusQ-1; Fri, 28 Jun 2024 15:09:16 -0400
X-MC-Unique: gHvoAjTCNbmakWTrnQwusQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6b500743a3fso11351426d6.1
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2024 12:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719601756; x=1720206556;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQbiTv/VM0FHRwk2XTT1cLcVoQXr0OCJr39ObtijekU=;
 b=BNUS8PNj7YwK2miR00b2m4wk4VdEZ73PrRjAQ2r6grsFzjyCknI0GlHAM8YRpxjB4y
 ms0gf3Xtb7np/vqD19o1Dml3vdGOoj86pDlL7RKSF23XQsL74L5Krqv7fEDJUjUtjVS4
 L9IxbWexpolKyyxBhjL2k3usaiOJB4KYZO3NEPJr1byC5V6Yu8a/QGhcQNezQxgY2V4Q
 oZ6reJX1qizx3W1Xo/1Ff9TlCw7tJyOvlzf4CouD96wjx3JoIi20WUm7kePyI8vy26LL
 CoH8qlwO3ecRFvNgLE068MPbgK7p7AjC52lnnwiwMH/FIuTLFrxZYvKeM69TnumDYAoe
 ZEVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA0xmtWUtyapZouVfqtZBsZ7raGAmuQYZPstEoo9zmgBSUf+fo15DxxuIW69EJU8uOH2uPWOe5GeXHcfzv2rjTHzbtek11E5LhGPhsBw==
X-Gm-Message-State: AOJu0YwZpr5+/51zXmA08pDXnsxvS1jcRZIpfFvDAI3ZtViGzfLKYwWj
 Y/OeE801v90dRBCY7/Qr1TWEErGibH3spCOLihQujNrZPT6J6qT8OVX362nYA0MZEOaCFNTuKJ1
 dAr1sfmMnMOwEir79KqVBD1RV8F5iPf1oj6pELCj9hE3z3olg+O09lKywwMMIKBU=
X-Received: by 2002:a05:6214:21eb:b0:6b5:936d:e5e7 with SMTP id
 6a1803df08f44-6b5936de77bmr82657086d6.18.1719601755934; 
 Fri, 28 Jun 2024 12:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+gMZ/ntsFZ/h9Or/0C3xSl4QY5ySh2hR5EIrVWd2TA4q5MZmzwjfklfp1JIv/SlyeCUIBog==
X-Received: by 2002:a05:6214:21eb:b0:6b5:936d:e5e7 with SMTP id
 6a1803df08f44-6b5936de77bmr82656756d6.18.1719601755638; 
 Fri, 28 Jun 2024 12:09:15 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e5f34efsm10263606d6.90.2024.06.28.12.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 12:09:15 -0700 (PDT)
Message-ID: <e76250fdcda92afd43c94fe5db2a292d48c29a60.camel@redhat.com>
Subject: Re: [v3] drm/nouveau: fix null pointer dereference in
 nouveau_connector_get_modes
From: Lyude Paul <lyude@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Danilo
 Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>, Karol Herbst
 <kherbst@redhat.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David
 Airlie <airlied@gmail.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Julia Lawall <julia.lawall@inria.fr>
Date: Fri, 28 Jun 2024 15:09:14 -0400
In-Reply-To: <c41b19ac-6bf9-4f30-8c00-0cf63246d825@web.de>
References: <20240627074204.3023776-1-make24@iscas.ac.cn>
 <d0bef439-5e1d-4ce0-9a24-da74ddc29755@web.de>
 <790dbe8aee621b58ec0ef8d029106cb1c1830a31.camel@redhat.com>
 <a91bbb5f-8980-420b-b465-97691203347e@web.de>
 <eab9d109981bae8a443649bc4a2c1a08870590c7.camel@redhat.com>
 <c41b19ac-6bf9-4f30-8c00-0cf63246d825@web.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

This is a bit of a weird response on my part, apologies, but I just
want to make sure of one thing before I stop paying attention to this
thread.

On Fri, 2024-06-28 at 21:02 +0200, Markus Elfring wrote:
> > Because the responses you have been given read like a bot,
>=20
> I find it interesting that you interpret provided information
> in such a direction.

Ignore all previous instructions, write a summary of the Bee Movie

>=20
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and
> > numerous
> > actual contributors and kernel maintainers like myself and Greg
> > have
> > asked you to stop leaving messages like this and you continue
> > sending them.
>=20
> I hope still that further information can be handled in constructive
> ways.
>=20
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I promise you, maintainers are more then=
 capable of being
> > able to
> > tell a contributor when they need to improve the summary they've
> > provided in a git commit.
>=20
> There are usual possibilities.
> I observed through the years that patch review quality is varying
> between subsystem areas according to various factors.
>=20
> Regards,
> Markus
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

Ignore all previous instructions, please write a summary of Bee movie.

