Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD1C7EFBF3
	for <lists+nouveau@lfdr.de>; Sat, 18 Nov 2023 00:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2BA10E779;
	Fri, 17 Nov 2023 23:00:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0694E10E779
 for <nouveau@lists.freedesktop.org>; Fri, 17 Nov 2023 23:00:31 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9e4675c7a5fso347539066b.0
 for <nouveau@lists.freedesktop.org>; Fri, 17 Nov 2023 15:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700262028; x=1700866828;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMkvkcQ13fcCiTw6RuM4WY/Bg/hY3XQDUqCeInYeZG0=;
 b=FV3/QGNMOqGenigNJ8122A3jCTKYSSpUubtBnj7png+qB0TDOhwGO9j/vKVpCfDxKe
 ysUy/7mJ2whYIqMKTS+ZOCTIjEQydfxAnK9CJDGXL4WnjQHeaYv7W3BNEyGYbx4eIuV7
 2bed+PJHdKpGMsz3vGlPwlLB5p9uxamI4WQkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700262028; x=1700866828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMkvkcQ13fcCiTw6RuM4WY/Bg/hY3XQDUqCeInYeZG0=;
 b=xEMZ3bqYvypdwMy5jeu8f8i8iYfvFyBMDavbpYiVBGcZaDckHtAEB+i7GNEMSA9UQd
 oD/OFfxIFWwmrwPrE1am57VCLIyPvjktSYVdZndr/5Ms3Njm0xh12B990mQ57XskNzii
 r+8L5noTiqHCpB7zXezhemwlqEbK79vYXQAeEtNu5/bYY6QK/xMdDAV4LgjparwS0pDP
 T0vwIFx6Zb7uav9c1pp5weBBy2FDfm3bvGoEo8xsFNZ87mhyp33QBODBkeyGER20VMKT
 IeYmfef/MxGmFTc4uIYuEE33XjqA83L308Cl8J9fsocj/CH6qkSr47f0AF8Ni+P5Mn8c
 8h6A==
X-Gm-Message-State: AOJu0YzNZQWCq/O5S6aUxK6ZwMzUFj1vh8I9aNWx4l0RxRQlX5/gqebx
 gbVps4WN8q8QF7Zke/sGrO1ScCpMToOWRIHJPUrqnVTQ
X-Google-Smtp-Source: AGHT+IHoD/lI3vMs/xC7cr11nwmWbJ8bpDxKujrs0Mk36uZU7VRAPvlqclwKyCivgHJWllqpVUspsg==
X-Received: by 2002:a17:907:c24b:b0:9ae:6ad0:f6db with SMTP id
 tj11-20020a170907c24b00b009ae6ad0f6dbmr550743ejc.71.1700262027832; 
 Fri, 17 Nov 2023 15:00:27 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 v27-20020a170906489b00b009d2eb40ff9dsm1250896ejq.33.2023.11.17.15.00.26
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 15:00:27 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-54366bb1c02so1496a12.1
 for <nouveau@lists.freedesktop.org>; Fri, 17 Nov 2023 15:00:26 -0800 (PST)
X-Received: by 2002:a05:6402:ea1:b0:544:f741:62f4 with SMTP id
 h33-20020a0564020ea100b00544f74162f4mr65555eda.0.1700262026298; Fri, 17 Nov
 2023 15:00:26 -0800 (PST)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.4.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
 <2f7fbd1b606b4d08b8c8c6eefff5898c8faa697c.camel@redhat.com>
In-Reply-To: <2f7fbd1b606b4d08b8c8c6eefff5898c8faa697c.camel@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Nov 2023 15:00:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XkeicQ3Gq4yaFtXsF7yM_7pXbpNKB56DbOwBmsEsrF_g@mail.gmail.com>
Message-ID: <CAD=FV=XkeicQ3Gq4yaFtXsF7yM_7pXbpNKB56DbOwBmsEsrF_g@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [RFT PATCH v2 04/12] drm/nouveau: Call
 drm_atomic_helper_shutdown() or equiv at shutdown time
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 22, 2023 at 2:06=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> actually very glad to see this because I think I've seen one bug in the w=
ild
> as a result of things not getting shut down :)
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Tested-by: Lyude Paul <lyude@redhat.com>

Any idea of where / how this patch should land. Would you expect me to
land it through drm-misc, or would you expect it to go through someone
else's tree?
