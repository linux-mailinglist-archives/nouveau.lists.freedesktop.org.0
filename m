Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A38951071F
	for <lists+nouveau@lfdr.de>; Tue, 26 Apr 2022 20:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8546610E24E;
	Tue, 26 Apr 2022 18:34:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7267210E24E
 for <nouveau@lists.freedesktop.org>; Tue, 26 Apr 2022 18:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650998074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eJubVxidxrH43nT1ZcESqGVo+TV4vGiI9S8510OYaUk=;
 b=d7aZ+8YfcSH/Rck7V2XQ/4epEAoRZ7zaVfVjfdZoQsg/PtLIWf0HI9oFJzD4H2XghVCDrR
 21++f1O+1PmkZThWmd1HXMgNNIgzSw6rnt14sDJ06q0hINVuNq1+Xb33nFUUew451O14WI
 Rf7kB5FLXUuNRJf7u3b8/I/U1SoIbm4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-_xfyHfsrNjixzIfv-uFkpA-1; Tue, 26 Apr 2022 14:34:33 -0400
X-MC-Unique: _xfyHfsrNjixzIfv-uFkpA-1
Received: by mail-qk1-f197.google.com with SMTP id
 p207-20020a3742d8000000b0069e80ba4a17so12304451qka.4
 for <nouveau@lists.freedesktop.org>; Tue, 26 Apr 2022 11:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=eJubVxidxrH43nT1ZcESqGVo+TV4vGiI9S8510OYaUk=;
 b=PkMAnlGtgOejOre87tN8baCvHiQl6kXWNUClBmbNeVEqq4Z/ZRRZ0ycgspxBpBHDEX
 XEPBAFbs7/H3RDzBx1MctVh3HSsyGiidGMUoi8kBIYqdmyt5qZuX6YJ+RNJlGL8nupeq
 tHGxAYHv3/Fyri2kONB8Zb951uoK0CkkLv7soOE6flIt/h2NpsCTyAmy8kpcycuc9X76
 BxNetIV2EmY8V3Yx/UnKZA8R+zfrovNk9fX8yoTnHwztbeaq6FnaBzEkquALWv1FZ1cP
 afmr3Cc+9CZDlZ/m+Je0sEoX0WeZWKGsb7u6+1gj8BGZoRbi5aO3ARNmVXF7K1TFkcW3
 9FhA==
X-Gm-Message-State: AOAM530xkrct4CKkNos8+x0l/39DOWO0gjZ37OFkL9TpwYdhwHxPCsm7
 MfRDQFP0Hjq8dVPWyOC0X7NcWoklohMAqNQyTYr4cMohgLh/0CaLWSAtm4E1VZlWKr4TzFx6r2N
 Mc3m+RcZRu55+RH/i1rpohBWA4A==
X-Received: by 2002:a05:6214:4011:b0:446:63b6:8b51 with SMTP id
 kd17-20020a056214401100b0044663b68b51mr17416048qvb.43.1650998072561; 
 Tue, 26 Apr 2022 11:34:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSTyxghOMakuSzLg+vVd1jQRAhTlvSuZxjU1DMb91ySKyNOQTzvYi4NffiezRcnRfbz+CZSQ==
X-Received: by 2002:a05:6214:4011:b0:446:63b6:8b51 with SMTP id
 kd17-20020a056214401100b0044663b68b51mr17416023qvb.43.1650998072239; 
 Tue, 26 Apr 2022 11:34:32 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 22-20020ac85916000000b002f3402e34a3sm8785857qty.55.2022.04.26.11.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:34:31 -0700 (PDT)
Message-ID: <fa4b1543a0547d505d73a74002eedc12de03e910.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Tue, 26 Apr 2022 14:34:30 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] XDC 2022: Registration & Call for Proposals now open!
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
Cc: board@foundation.x.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello!

The 2022 X.Org Developers Conference is being held in conjunction with
the 2022 Wine Developers Conference.  This is a meeting to bring
together developers working on all things open graphics (Linux kernel,
Mesa, DRM, Wayland, X11, etc.) as well as developers for the Wine
Project, a key consumer of open graphics.

Registration & Call for Proposals are now open for both XDC 2022 and
WineConf 2022, which will take place on October 4-6, 2022 in
Minneapolis, Minnesota, USA. 

https://xdc2022.x.org
 
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!
 
In order to register as attendee, you will therefore need to do it via
the XDC website:
 
https://indico.freedesktop.org/event/2/registrations/2/
 
In addition to registration, the CfP is now open for talks, workshops
and demos at XDC 2022. While any serious proposal will be gratefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.
 
We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more: 
 
https://indico.freedesktop.org/event/2/abstracts/
 
The deadline for submissions is Monday July 4th, 2022.
 
Check out our Reimbursement Policy to accept speaker
expenses for X.Org events like XDC 2022:
 
https://www.x.org/wiki/XorgFoundation/Policies/Reimbursement/

If you have any questions, please send me an email to
xdc@codeweavers.com, adding on CC the X.org board (board
at foundation.x.org).
 
And don't forget, you can follow us on Twitter for all the latest
updates and to stay connected:
 
https://twitter.com/XOrgDevConf

Best regards,
Lyude Paul, on behalf of X.org

