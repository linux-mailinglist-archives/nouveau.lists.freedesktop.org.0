Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573B084AD44
	for <lists+nouveau@lfdr.de>; Tue,  6 Feb 2024 05:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09251128C8;
	Tue,  6 Feb 2024 04:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fT+9CuKz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84151128C8
 for <nouveau@lists.freedesktop.org>; Tue,  6 Feb 2024 04:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707192493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmqDTBWRj3aAeUtwIdD9y9hPywJiINPBG5+2t9yUVEk=;
 b=fT+9CuKz4Ar0kuIvewyX1ZtcAc3puxz/ViKIml+5dvRVRrnmZenbw8NWQupVbjPtPhO8Iz
 Eipcb6/nI460MN1en9+vRHH08G1wO2bB6BdCxKPQHp3HUirzL+80I2JjBfu71UamlUzvqW
 mC2+tntsKVT27XOZW/DB3uc8FxHPJ5c=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-1C6kKPEONTWbgElFGrZqwg-1; Mon, 05 Feb 2024 23:08:12 -0500
X-MC-Unique: 1C6kKPEONTWbgElFGrZqwg-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7855f31ecb2so32312385a.1
 for <nouveau@lists.freedesktop.org>; Mon, 05 Feb 2024 20:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707192492; x=1707797292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gmqDTBWRj3aAeUtwIdD9y9hPywJiINPBG5+2t9yUVEk=;
 b=iSMQIzd0QT3eT3IYcW+YRf7yDg1bJG83Oo8hp3qVAv+0uFAxa8OKhHViqZZV5tM7RZ
 qnhNT/6HmP63XToVD8BI6CsWUPPRPA2StVTVFeQQr5DIqD1vR/o/v1zAfSRV8WfemxO5
 FcIhJFAdCOunBpX9iWyMyF0S1pI89s9KsNkXzpGcviqPa5M2XAhflGolXrZc5hz9Zsgy
 nDimwVCAB1IecHW1JzrlcgNC4FBrcCI/XRbcoSxcSXrawzvoAVbVXrZ4ynyCTm3QNv2/
 W7jGSo4sopaxgzb6+fdYo0GjDBTCml7CuPW41EuAFIsHvuCRdB73A/8Af89UH0WIe5L5
 KMcQ==
X-Gm-Message-State: AOJu0YwVJ30avEK4i+2fM3U3380IcgcVOninpjmMpr/QyACJ7tgMqTwp
 YpZSuG6SIm9JEU43JA1nUUxHq9BWhGmAz4tsF7oPvM6FLfXggGmd+YP2wQ9cTRDRc7m7yoJvml9
 Cn3lqcZ5WplZRxBlGcyurr34+i6QMY2l9hEack7tbrApgSwDBUa9PUij+rH9AyzrGCz+CGSCmtL
 MtNaex2fTcu0fkUhiHuAObcFPe0RYaOoVhr15xCiDQHbcLMA==
X-Received: by 2002:a05:620a:1255:b0:783:df66:cf1a with SMTP id
 a21-20020a05620a125500b00783df66cf1amr10644896qkl.37.1707192492112; 
 Mon, 05 Feb 2024 20:08:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFc0fnFIkHPt8MPb+gDKO7WuvlTKowsDEmPML7k0dmsW3H/4u6/XTe48maCAps2k5qSMZs1EwO5INt6vKVtJ4Q=
X-Received: by 2002:a05:620a:1255:b0:783:df66:cf1a with SMTP id
 a21-20020a05620a125500b00783df66cf1amr10644889qkl.37.1707192491868; Mon, 05
 Feb 2024 20:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20240205214452.2580940-1-ttabi@nvidia.com>
 <CAMwc25r0zr4orsFKRO4rVNMrNNQh5PxWze9b3xG3HvXuM1CpcQ@mail.gmail.com>
 <5b8db6ee34d565a93a9cd15643daa6a8dc17f513.camel@nvidia.com>
In-Reply-To: <5b8db6ee34d565a93a9cd15643daa6a8dc17f513.camel@nvidia.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 6 Feb 2024 14:08:00 +1000
Message-ID: <CAMwc25r5XCHn=+gzmbXweqJSzRth1152u6vf+R5+b8r2C-bDAA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: expose GSP-RM logging buffers via debugfs
To: Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, "dakr@redhat.com" <dakr@redhat.com>
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

On Tue, Feb 6, 2024 at 1:55=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Tue, 2024-02-06 at 10:35 +1000, David Airlie wrote:
> > >
> > > An end-user can capture the logs using the following commands:
> > >
> > >     cp /sys/kernel/debug/nouveau/loginit loginit
> > >     cp /sys/kernel/debug/nouveau/logrm logrm
> > >     cp /sys/kernel/debug/nouveau/logintr logintr
> > >     cp /sys/kernel/debug/nouveau/logpmu logpmu
> >
> > If we have 2 GPUs won't this conflict on driver load?
> >
> > Do we need to at least make subdirs or if two early in boot to have
> > ids, use the pci path?
>
> I knew I was forgetting something.  I will fix this to use per-GPU paths.=
  Any
> suggestion as to what to use to differentiate?  PCI ID?  Is there some ot=
her
> identifier?

I'm not sure if we've registered dri minor devices at that point to
get card numbers, so probably would have to come from the pci id (and
we'd have to fix arm later).

Dave.

