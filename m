Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC935FA26
	for <lists+nouveau@lfdr.de>; Wed, 14 Apr 2021 20:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653B36E4C4;
	Wed, 14 Apr 2021 18:00:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B363A6E42C
 for <nouveau@lists.freedesktop.org>; Wed, 14 Apr 2021 12:15:04 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id c16so20375842oib.3
 for <nouveau@lists.freedesktop.org>; Wed, 14 Apr 2021 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/jaGKbmZS7gkcDAm1sNfR4v96fGf0NAHXY3OLvsD8V0=;
 b=Zp5N9+Az4VdQAAEGeQkRRU34AxpialyeKGGFdFvqQnUOUE6lms5TRn9MdVHluUkRhF
 OiMu7UtrZs/JGCXMdnFhh3DYmUgcLE60BwN661EjhLvroogu2Cc773t1GgiEdZNv2r2B
 1cJF5PyxsJHaJNjw+pcbiOuH2ZCh7JDg39RazU7BEJLE5JeUAv0IFdeEhcpz0yyyYjWM
 ke6i815j1PFRatQz9aG21drQtLPXC4dpSI3lNs5uZGq4msrbKKhPngzCpbd3JtlijiYZ
 zCOEw0yj1JvVluTzOPCiEDeQ9PFvD7EmlgRsFoQ3Q9YVMqTeR7lRcwBLYeAIVUtfLMqo
 96RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/jaGKbmZS7gkcDAm1sNfR4v96fGf0NAHXY3OLvsD8V0=;
 b=WRXfmwJJ+KYLpiJtx7VBJdSx4bxEJ2luk7cE5VL/NiD6vhFFs1KYEawRbKUV4H8quG
 j+DZfcvg06gmKa3aNM4w/CTWJ9LuXy6YSvmgupHKThukuWYgxkTFdw+uREsXcn2FIsI/
 frtz/jNdQKWtlR2ozS2VaRHpEdrWouLiEtHo4SneqvqopFGzee3NS5fqfTU8gLd3aHp8
 3JOJ8UCZu9OQnSr6fwZelbeFk3sctDFC12KYUTL2kznHMH6B3munslpkoMx3OWcRpmfp
 3Sfcu0N7HZTGwCF8A8ZP5FglphuXbHCIWzLDCnfwloOmyR9zfQGdHul5J+VTLbrNcUs3
 tjfw==
X-Gm-Message-State: AOAM533pdos5i3tMmOj+XeoktjtKNKAOifAdwpsNgSfINevl71lQv1zz
 9CT1PmdtkvejMjbdhJrpt3dcSqDK3h82P6CfL0Fmb5k/QMY=
X-Google-Smtp-Source: ABdhPJz9dUyfUr3zams2SgSpHm2HccYSbr+krzH46coUh484I19KS+2QANg4cvtOAv5LGaK78n3n8QVKGJZn6do0NEE=
X-Received: by 2002:aca:1309:: with SMTP id e9mr2069833oii.160.1618402503693; 
 Wed, 14 Apr 2021 05:15:03 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6IuN56m5?= <w359405949@gmail.com>
Date: Wed, 14 Apr 2021 20:14:52 +0800
Message-ID: <CAOqVzGRqFDyEK=qur9E3O9f6OYvxe4VBn0Q_dWzRZjcFTEB3cQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 14 Apr 2021 18:00:12 +0000
Subject: [Nouveau] can nouveau run opencl now?
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
Content-Type: multipart/mixed; boundary="===============0044014790=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0044014790==
Content-Type: multipart/alternative; boundary="0000000000005619be05bfedb229"

--0000000000005619be05bfedb229
Content-Type: text/plain; charset="UTF-8"

and how?

--0000000000005619be05bfedb229
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">and how?</div>

--0000000000005619be05bfedb229--

--===============0044014790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0044014790==--
