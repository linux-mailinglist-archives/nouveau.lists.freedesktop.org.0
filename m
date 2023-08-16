Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DEB77EBC0
	for <lists+nouveau@lfdr.de>; Wed, 16 Aug 2023 23:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849DA10E3BF;
	Wed, 16 Aug 2023 21:27:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0948610E100
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 21:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692221241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhlCltG/6J4T9mqv57bOozrctEIXFs/9BESilmBG2aE=;
 b=fK9pJKDWRtgFildLRHTQRVW8DGmkiE/QSOEeelT82mZJ9xxt6xi1/BQLNljKcqzOBYb0BP
 2Mof3pPoXWLygNO+y5S8J/cjzzx0+sk7P/cMoMewgXpnTR9HbaOWds6/CD14Lzi3EjeR+V
 zYeNI+3GpwVq+risSjc/6qP8G059RuM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-hehQYpuePRmFV8cSaLSW1A-1; Wed, 16 Aug 2023 17:27:17 -0400
X-MC-Unique: hehQYpuePRmFV8cSaLSW1A-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2a7a6393ba6so12788111fa.1
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 14:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692221236; x=1692826036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhlCltG/6J4T9mqv57bOozrctEIXFs/9BESilmBG2aE=;
 b=YP3xj1ffhAZaavWylnTykLHZpiV2OcstLxTapPRPHXrkR4wFcHvzxm81f5307z9Li4
 fZ3gdoi8FhgOXSRetMc9MUhyTafLyCmBbD2heHTywQPTTxvypEJCs7vGQvonKPrgCSNz
 iTdwh6zRPlLoYMgB0Zh7t6NKThjxv4izrlRJ0ng40kd4eXwWIEu47AK9j4qhA1Mlffb/
 uXtsVt5HqdqnrPc4vawXV7ChxjaQ51PKvWPkZ1UTEYYxShRDkXBv6yxKVNkMUWL8cy+U
 AnMcuFAZYufHSI07IwT3LDO2gYEhcm618NFW90i4Lw4W5gkNpXaBqm9XoWlKD2NVktjh
 yBrw==
X-Gm-Message-State: AOJu0YyShuo/b8UsEPUtQ8ifqaTGQ+Hgx0rWJpdc5XsGRPGePCbk7zHp
 GgYBf+axe39quBwXJMJO84u1EwBz61T3YHKoRMD0zwcPszeylF/Yi8ifutGwVe2y/1usMEjuXjt
 lpf+2Fhjx52mILizFcatLBVWxjseYS8hPi4gneOGZ1g==
X-Received: by 2002:a2e:b53a:0:b0:2b8:3c52:113 with SMTP id
 z26-20020a2eb53a000000b002b83c520113mr2446680ljm.5.1692221236467; 
 Wed, 16 Aug 2023 14:27:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqEJkEAo5Pa4rNZ4q8LahYF0AcRVhQvLqoo9MCByspT6ADS2ntaRvd1hh34mL6+q7aFi+DN5uWeOnI1es4zj0=
X-Received: by 2002:a2e:b53a:0:b0:2b8:3c52:113 with SMTP id
 z26-20020a2eb53a000000b002b83c520113mr2446668ljm.5.1692221236114; Wed, 16 Aug
 2023 14:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
In-Reply-To: <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 16 Aug 2023 23:27:05 +0200
Message-ID: <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
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

On Wed, Aug 16, 2023 at 5:13=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Wed, Aug 16, 2023 at 04:57:28PM +0200, Karol Herbst wrote:
> > Do you have any connectors listed in "/sys/class/drm"?
>
> tree /sys/class/drm/
> /sys/class/drm/
> =E2=94=9C=E2=94=80=E2=94=80 card0 -> ../../devices/pci0000:00/0000:00:02.=
0/0000:03:00.0/drm/card0
> =E2=94=9C=E2=94=80=E2=94=80 renderD128 -> ../../devices/pci0000:00/0000:0=
0:02.0/0000:03:00.0/drm/renderD128
> =E2=94=94=E2=94=80=E2=94=80 version
>
> > Also, mind sharing your vbios.rom file from
> > "/sys/kernel/debug/dri/0/vbios.rom"?
>
> Attached.

that GPU has only a `DMS-59` connector, is that right? I have such a
GPU myself, so maybe I can trigger that bug there, let's see..

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

