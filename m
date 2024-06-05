Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6F8FC94A
	for <lists+nouveau@lfdr.de>; Wed,  5 Jun 2024 12:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF28F10E0C6;
	Wed,  5 Jun 2024 10:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dS50f3qY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D7B10E6EB
 for <nouveau@lists.freedesktop.org>; Wed,  5 Jun 2024 10:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717584164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BU/tJ+9EKfgrfjcJ+xT6Fh0B6VfsWIYzwltmsdBYNMY=;
 b=dS50f3qYAloXYLSCF6JVy0qtEoE7E2wjlSfHsK9M5IcFQsbexIFJ3iLIxPCK0B80cA4e0O
 1NTmWT0dqH0yuUW4Aj5I7fKtzuCljIqB4EnSYIJXRs5glMisVZcZJN3fNwKqtbGAn3PzYg
 fMuUupEbXJTT/Gnsbei8Avb+eLxHm6c=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-XfAc6-THNKKeWuG8m_Bcvw-1; Wed, 05 Jun 2024 06:42:42 -0400
X-MC-Unique: XfAc6-THNKKeWuG8m_Bcvw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2eacb8b2ff1so520641fa.3
 for <nouveau@lists.freedesktop.org>; Wed, 05 Jun 2024 03:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717584161; x=1718188961;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BU/tJ+9EKfgrfjcJ+xT6Fh0B6VfsWIYzwltmsdBYNMY=;
 b=thhGENwgZKsv9+KmfCbY9STtLuiXExmxSzZAAjxJGUYSa044ohRXyDh/m1VI9RETt6
 /3VczHvafUpSZfeEy73s+AroUxjqmMOXnu2TmoYdCE7ALn8wFF6a8b2+Z7TkURoRrBa1
 qse2B02HHPYI08NWQtPbahQCJ1l64z2WzaBHaJ4WGQ5TBfV4tWwf0z869iry7mhWD85I
 5En4A5MwAcGFuaw6n8s1tZ4DCZvj7BtK2xNu23MN+YvEWnlMuJ9TG14I4w63msIzsJ5m
 69Lz7LY4B4v7gz+J1w7Gx+CkHbpIiiX0dxNgBFFqIrvlRJNLqPuzZDVKzneGPXnNiXfV
 Mo5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+HQIz/Jv2IqwnZFYDFs6OmpwNzqdkUuxxmb3Jgj9TYKCdAWwsagDB7+k7DTRuZkRtuuZj4lvjCojXxJICjgg/5/NJ1PRVC+8TsagUqw==
X-Gm-Message-State: AOJu0Yzzq6Rmt+dbpxOBq0/i/ZVLzWWDagiyyAxv/l2QNy2a2tRZ9uEH
 LL/iHlAIdWU/W8Cioh15nNCAxLCf72XgbfyG0jw3NcgoHELj72q8p7RC890yDaBgzO6BykOecUf
 eQIB6MNDf0fasSXMuNGP3rOYFnmKfs53Twy5E6YThSyX4U6x2LeNma72aDBrdISo=
X-Received: by 2002:a05:6512:15a5:b0:52b:8270:eb67 with SMTP id
 2adb3069b0e04-52bab28755cmr1571157e87.0.1717584161017; 
 Wed, 05 Jun 2024 03:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9zBdWjZNQg7JUusR+DufaqqPSRkraMoxQ6h/Yj9OTkuWmMtul7e+i84pfxha6Is1UmDmhvw==
X-Received: by 2002:a05:6512:15a5:b0:52b:8270:eb67 with SMTP id
 2adb3069b0e04-52bab28755cmr1571144e87.0.1717584160598; 
 Wed, 05 Jun 2024 03:42:40 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 ([2001:9e8:32e6:e600:c901:4daf:2476:80ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064998bsm14081463f8f.91.2024.06.05.03.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 03:42:40 -0700 (PDT)
Message-ID: <8a3a64f300eb3a5bbc291d6527a1b4bfdef59acb.camel@redhat.com>
Subject: Re: LLM GPU Support
From: Philipp Stanner <pstanner@redhat.com>
To: Blake McBride <blake1024@gmail.com>, nouveau@lists.freedesktop.org
Date: Wed, 05 Jun 2024 12:42:39 +0200
In-Reply-To: <CABwHSOvVc5ZbGv=zj9CJJfkO=aU+X2_W8ms816dufVx2P7LSvg@mail.gmail.com>
References: <CABwHSOvVc5ZbGv=zj9CJJfkO=aU+X2_W8ms816dufVx2P7LSvg@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
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

On Tue, 2024-06-04 at 10:27 -0500, Blake McBride wrote:
> Greetings,
>=20
> I have used the nouveau driver with my Nvidia card on Linux.=C2=A0 Works
> fine.=C2=A0 However, my problem has to do with running LLM on my GPU with
> your driver.=C2=A0 My impression is, it doesn't work.=C2=A0 Am I correct?

Yo,

"it doesn't work" is not a very precise error description.

The maintainers will need info such as:

Which kernel version, what payload, how's the payload invoked and what
is the observed error?


P.

>=20
> Given today's environment, this may be a good FAQ.
>=20
> Thanks!
>=20
> Blake McBride
>=20

