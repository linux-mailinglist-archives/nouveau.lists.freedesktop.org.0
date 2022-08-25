Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 787095A18AF
	for <lists+nouveau@lfdr.de>; Thu, 25 Aug 2022 20:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16EF10E072;
	Thu, 25 Aug 2022 18:20:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7E410E025
 for <nouveau@lists.freedesktop.org>; Thu, 25 Aug 2022 18:20:28 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-33dbbf69b3dso65360797b3.1
 for <nouveau@lists.freedesktop.org>; Thu, 25 Aug 2022 11:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=uig/6MYAR36rD59j8Vi6nTWfQhMgr5YARco48vJAMTI=;
 b=JFrkJwGGZeKVga/c2+MKx88XR6c+dlO5XCgy56hk/Y8PhtGEVjJ91VDUXYrQ9/tjGU
 M7VVBfKpbwURNCY23QyiqbJKXtvPzPuwA21qLrId7UzkEKqxD9Ax+9UOJ6b6A5qjJUR9
 pPxe8CajLWwun67IxYFY6AJfBUFJth5AuHuidqFthEQLLjf4Tx0qEjQvXApp4NQ4Yf1T
 N4U1e3HXBIXqkocsAyYojK04fm+W4Kq7iRXQPHVaPJP5lQUboLMMniH3eFpic73Wvv++
 0R53/WfXnyUAAWt5ki1QXWMjVTlHlpKJQspgthNaERSXHD5U82lLev7D1S7svhHmL6HG
 GqfA==
X-Gm-Message-State: ACgBeo3BGmY8GfXD7Nh3QfQ5sdxQQVR42GAVYBW1DyqTYp3NalnTPfUo
 Z23OAAuZAYeLElAfsMmx4nuGcoaavk0yrgx85Y0=
X-Google-Smtp-Source: AA6agR7qzCbl13Mm9e8JxxntHyv9wGkANy9di366zSW3SCCGjr0uQd6hZbQWdeTFC4Rf0dy5fw0tVnA6ltCE0hcrePk=
X-Received: by 2002:a25:ec0c:0:b0:690:d092:2d56 with SMTP id
 j12-20020a25ec0c000000b00690d0922d56mr4105726ybh.622.1661451627618; Thu, 25
 Aug 2022 11:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220823185134.14464-1-mario.limonciello@amd.com>
 <20220823185134.14464-2-mario.limonciello@amd.com>
 <CAAd53p6MfBaRTTNJ5mAFU6XfDndLFJihLHKdrbq8Nq-27LArjg@mail.gmail.com>
 <MN0PR12MB6101DE7A18DC0343AEBE89C5E2739@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB6101DE7A18DC0343AEBE89C5E2739@MN0PR12MB6101.namprd12.prod.outlook.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 25 Aug 2022 20:20:16 +0200
Message-ID: <CAJZ5v0gdn7+EyQ7Br5WxT8pDr4+Y+Fgc274-at5-CZfQ572QKg@mail.gmail.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH 1/4] ACPI: OSI: Remove Linux-Dell-Video _OSI
 string
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
Cc: "ddadap@nvidia.com" <ddadap@nvidia.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
 Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 8:28 PM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> [Public]
>
>
>
> > -----Original Message-----
> > From: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > Sent: Wednesday, August 24, 2022 09:17
> > To: Limonciello, Mario <Mario.Limonciello@amd.com>
> > Cc: rafael@kernel.org; Len Brown <lenb@kernel.org>;
> > nouveau@lists.freedesktop.org; hdegoede@redhat.com;
> > ddadap@nvidia.com; Dell.Client.Kernel@dell.com; kherbst@redhat.com;
> > Lyude Paul <lyude@redhat.com>; linux-acpi@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 1/4] ACPI: OSI: Remove Linux-Dell-Video _OSI string
> >
> > On Wed, Aug 24, 2022 at 2:51 AM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> > >
> > > This string was introduced because drivers for NVIDIA hardware
> > > had bugs supporting RTD3 in the past.  Thoes bugs have been fixed
> > > by commit 5775b843a619 ("PCI: Restore config space on runtime resume
> > > despite being unbound"). so vendors shouldn't be using this string
> > > to modify ASL anymore.
> >
> > Add some backgrounds on what happened.
> >
> > Before proprietary NVIDIA driver supports RTD3, Ubuntu has a mechanism
> > that can switch PRIME on and off, though it requires to logout/login
> > to make the library switch happen.
> > When the PRIME is off, the mechanism unload NVIDIA driver and put the
> > device to D3cold, but GPU never came back to D0 again. So ODM use the
> > _OSI to expose an old _DSM method to switch the power on/off.
> >
> > The issue is fixed by the said commit so we can discard the workaround now.
> >
>
> Thanks for that.  If this series needs to spin I'll roll that into the commit message.
> Otherwise perhaps Rafael can pick up some of it if he thinks it makes sense to include.

I've applied the series (as 6.1 material) and included the information
above into the changelog of the first patch.  I've also edited the
changelogs of the other patches somewhat.

Thanks!
