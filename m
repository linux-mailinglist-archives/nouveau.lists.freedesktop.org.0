Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E3C77EDC0
	for <lists+nouveau@lfdr.de>; Thu, 17 Aug 2023 01:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A3910E122;
	Wed, 16 Aug 2023 23:18:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966FD10E122
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 23:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692227906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e27Prao+8w59knGJmOWj+3FndpKc2qgsbyaKBRsKylU=;
 b=GaoHb4/rbh9UXABrp5iX8spotzgZtDfJxO9hDUiN0OTPOq26yAQC6sHEDsixxWHogue9At
 5j2DSZHxP4eECJCLOruamSgGnLzfENwGIOHsBc0EqNDz/HUbuPEXRqbuGjwpGet1XBeadM
 vTrm2zsZMv1KFoAobMHgldKxLR24eBI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-A09hOKL-MNCovmT6eOTa6w-1; Wed, 16 Aug 2023 19:18:25 -0400
X-MC-Unique: A09hOKL-MNCovmT6eOTa6w-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4fe6b399119so1420292e87.1
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 16:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692227904; x=1692832704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e27Prao+8w59knGJmOWj+3FndpKc2qgsbyaKBRsKylU=;
 b=d8EbXQYn+BhMPAGBE9YNCN8lZj8vGnuLmwqrGPGcqtBIg6Sdj5si2DdqScW+qMYrJz
 fNIlVkWAOEUg5o6TRMStEQZ06vow7enfnzSRZcMM/rYnCumT2gSYcphHeeO1jFutvtUA
 K8YqjsUdWZiBRZx/V59Gpbn4sV5tAVb1ts7o3PKJ0pfeKLkj6cEG8dtW2jE1vlw4Vqxt
 Be4GA2EcVp2DVPqdw3hEaZH9aVfHR7awYZ7VBF3xyIMo5mW0Mr8z+WPS4tlFqOxonKz8
 XKUUjCu+HUQxxTXWkEeCYbvpWRR2gy1rmWsTTvFFHNL0KLDGlJIx+r0eLtlqVzZk49X0
 sjMg==
X-Gm-Message-State: AOJu0Yz/R1jWFQi9mzmufVOunLV7ZKV89ynUe2eAoOpQbEE8l9M5A2rN
 4ga8vEQBcGcZ/5xdgwIHSe6LVGTnFx+dyViQd+jZ4eZVxLvrCHOk7s3h7mj41aREXpofiRMzOY7
 fpY4qthxSyaU38KNpR0WWSuEVXKMhl7pyMFg4P9ksaA==
X-Received: by 2002:a2e:535d:0:b0:2b6:af68:6803 with SMTP id
 t29-20020a2e535d000000b002b6af686803mr2442422ljd.4.1692227904016; 
 Wed, 16 Aug 2023 16:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1K6kBGziG4deNuHLAraS88W59a/Ay7fpQlOgwaRtMAQHHcJu47CsepbxS6R+gOkE0cHNdxbWZY06UjdNnDbI=
X-Received: by 2002:a2e:535d:0:b0:2b6:af68:6803 with SMTP id
 t29-20020a2e535d000000b002b6af686803mr2442415ljd.4.1692227903720; Wed, 16 Aug
 2023 16:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
 <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
 <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
In-Reply-To: <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Aug 2023 01:18:12 +0200
Message-ID: <CACO55ts7430tAUDC+0qY0EZ5ReO=2Rjwj1SzHaBLodmyBgrUrw@mail.gmail.com>
To: Borislav Petkov <bp@alien8.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: fix use-after-free in error
 handling of nouveau_connector_create
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
Cc: Takashi Iwai <tiwai@suse.de>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 12:14=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Wed, Aug 16, 2023 at 11:27:05PM +0200, Karol Herbst wrote:
> > that GPU has only a `DMS-59` connector, is that right?
>
> No clue. How do I figure that out?
>

do you have one of these? https://en.wikipedia.org/wiki/DMS-59

> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

